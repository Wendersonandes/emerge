class User < ActiveRecord::Base
  include Concerns::UserImagesConcern

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :lockable, :async

  after_create :assign_default_role, :subscribe_to_mailchimp, :assign_tester_role
  before_create :build_default_person, :build_user_preferences_on_create

  rolify

  acts_as_follower
  acts_as_followable

  scope :recents_users, -> { where("created_at > ? AND first_name IS NOT NULL", Date.today - 7).limit(5) }

  scope :subscriber, -> { joins(:user_preferences).where('never_notify_me is false') }
  scope :daily_subscriber, -> { subscriber.joins(:user_preferences).where('send_daily_email is true') }
  scope :weekly_subscriber, -> { subscriber.joins(:user_preferences).where('send_weekly_email is true') }
  scope :montly_subscriber, -> { subscriber.joins(:user_preferences).where('send_monthly_email is true') }
  scope :on_closing_subscriber, -> { subscriber.joins(:user_preferences).where('notify_on_closing_opportunities is true') }
  scope :on_new_opportunity_subscriber, -> { subscriber.joins(:user_preferences).where('notify_on_new_opportunity is true') }


  has_many :authentications, dependent: :destroy, validate: false, inverse_of: :user do
    def grouped_with_oauth
      includes(:oauth_cache).group_by {|a| a.provider }
    end
  end

  has_many :contributions, :class_name => "Opportunity", :foreign_key => "author_id"

  has_one :person, :dependent => :destroy
  accepts_nested_attributes_for :person, :reject_if => :all_blank, :allow_destroy => true

  has_one :user_preferences, :dependent => :destroy
  accepts_nested_attributes_for :user_preferences, :reject_if => :all_blank, :allow_destroy => true

  has_many :authorizations


  after_create :send_welcome_emails

  def display_name
    first_name.presence || email.split('@')[0]
  end

  # Case insensitive email lookup.
  #
  # See Devise.config.case_insensitive_keys.
  # Devise does not automatically downcase email lookups.
  def self.find_by_email(email)
    find_by(email: email.downcase)
    # Use ILIKE if using PostgreSQL and Devise.config.case_insensitive_keys=[]
    #where('email ILIKE ?', email).first
  end

  # Override Devise to allow for Authentication or password.
  #
  # An invalid authentication is allowed for a new record since the record
  # needs to first be saved before the authentication.user_id can be set.
  def password_required?
    if authentications.empty?
      super || encrypted_password.blank?
    elsif new_record?
      false
    else
      super || encrypted_password.blank? && authentications.find{|a| a.valid?}.nil?
    end
  end

  # Merge attributes from Authentication if User attribute is blank.
  #
  # If User has fields that do not match the Authentication field name,
  # modify this method as needed.
  def reverse_merge_attributes_from_auth(auth)
    auth.oauth_data.each do |k, v|
      self[k] = v if self.respond_to?("#{k}=") && self[k].blank?
    end
  end

  # Do not require email confirmation to login or perform actions
  def confirmation_required?
    false
  end

  def send_welcome_emails
    # UserMailer.delay.welcome_email(self.id)
    # UserMailer.delay_for(5.days).find_more_friends_email(self.id)
  end

  def build_default_person
    build_person(:fullname => self.full_name)
    true
  end

  def build_user_preferences_on_create
    build_user_preferences
  end

  def to_s
    username
  end

  def username=(value)
    super(value.to_s.strip)
  end

  def assign_default_role
    add_role(:user)
  end

  def assign_tester_role
    add_role(:beta_tester)
  end

  def subscribe_to_mailchimp
    SubscribeJob.perform_async(self)
  end

  def full_name
   "#{first_name} #{last_name}"
  end


  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user || User.where('email = ?', auth["info"]["email"]).first
      if user.blank?
       user = User.new
       user.password = Devise.friendly_token[0,10]
       user.name = auth.info.name
       user.email = auth.info.email
       if auth.provider == "twitter"
         user.save(:validate => false)
       else
         user.save
       end
     end
     authorization.username = auth.info.nickname
     authorization.user_id = user.id
     authorization.save
   end
   authorization.user
  end

end
