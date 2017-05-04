# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  date_birth             :date
#  name                   :string
#  admin                  :boolean          default(FALSE), not null
#

class User < ActiveRecord::Base

  attr_accessor :show_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

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

  has_many :contributions, :class_name => "Opportunity", :foreign_key => "author_id"

  has_one :person, :dependent => :destroy
  accepts_nested_attributes_for :person, :reject_if => :all_blank, :allow_destroy => true

  has_one :user_preferences, :dependent => :destroy
  accepts_nested_attributes_for :user_preferences, :reject_if => :all_blank, :allow_destroy => true

  has_many :authorizations

  #has_many :likes, dependent: :destroy
  #has_many :liked_opportunities, through: :likes, source: :likeable, source_type: "Opportunity"

  validates :terms, :acceptance => true, :on => :create
#  validates :email,
#            presence: true

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

#  def email_required?
#    super && provider.blank?
#  end

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
