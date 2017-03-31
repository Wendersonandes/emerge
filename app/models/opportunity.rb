# == Schema Information
#
# Table name: opportunities
#
#  id                              :integer          not null, primary key
#  title                           :string(255)
#  beginning                       :date
#  end_subscription                :date
#  result                          :date
#  extended                        :date
#  created_at                      :datetime
#  updated_at                      :datetime
#  author_id                       :integer
#  entry_manner                    :integer          default(0)
#  local_restriction               :integer          default(0)
#  opportunity_views_counter_cache :integer          default(0)
#  url_source                      :string
#  featured_image_data             :text
#  published_at                    :datetime
#  email_contact                   :string
#  ongoing                         :boolean          default(FALSE), not null
#  prospectus_url                  :string
#  scrapper_source                 :string
#  original_source_id              :integer
#  location                        :string
#  content                         :text
#  summary                         :string
#  raw_page_source                 :text
#

class Opportunity < ActiveRecord::Base

  before_create :create_summary, :build_default_opportunity_email_notification
  before_update :create_summary

  scope :published, -> { where("published_at IS NOT NULL") }
  scope :draft, -> { where("published_at IS NULL") }
  scope :open,              ->{ where("end_subscription >= ? or extended >= ?", Date.today, Date.today).published }
  scope :without_program,   ->{ where("program_id IS NULL") }
  scope :last_days,         ->{ where(end_subscription: Date.current..(1.week.from_now)) }
  scope :result_near,       ->{ where(result: Date.today..1.week.from_now) }
  scope :without_selecteds,  ->{ where("(select count(*) from opportunity_selecteds where opportunity_id=opportunities.id) = 0").where("result < ?", Date.today) }

  scope :recents,         -> { open.last(5).reverse }
  scope :short_recents,   -> { open.last(2).reverse }
  scope :closures,        -> { open.where(end_subscription: Date.today..Date.today + 7)}
  scope :short_closures,  -> { open.where(end_subscription: Date.today..Date.today + 5).limit(2)}
  scope :most_viewed,     -> { open.order('opportunity_views_counter_cache DESC').limit(20)}

  scope :closing_in_1_day, -> { where("end_subscription = ? or extended = ?", Date.today + 1.days, Date.today + 1.days)}
  scope :closing_in_2_day, -> { where("end_subscription = ? or extended = ?", Date.today + 2.days, Date.today + 2.days)}
  scope :closing_in_3_day, -> { where("end_subscription = ? or extended = ?", Date.today + 3.days, Date.today + 3.days)}
  scope :closing_in_5_day, -> { where("end_subscription = ? or extended = ?", Date.today + 5.days, Date.today + 5.days)}
  scope :closing_in_7_day, -> { where("end_subscription = ? or extended = ?", Date.today + 7.days, Date.today + 7.days)}

  scope :already_sent, -> (opportunity_id) {open.where(id: opportunity_id, notification_already_sent: true)}


	# include PgSearch
#	pg_search_scope :search,
#	:against => [:title, :content],
#  :associated_against => {
#    :categories => [:name],
#    :tags => [:name]
#  },
#	:using => {
#		tsearch: {
#    dictionary: 'portuguese',
#    :prefix => true,
#    :any_word => true,
#    },
#
#    :trigram => {
#      :only => [:title, :categories],
#      :threshold => 0.1
#      }
#    },
#  :ignoring => :accents
#
#  include FeaturedImageUploader[:featured_image]

	acts_as_followable

	acts_as_taggable
  acts_as_taggable_on :categories

	belongs_to :author, :class_name => "User", :foreign_key => "author_id"

	belongs_to :program

  has_one :url_subscription, :dependent => :destroy
  accepts_nested_attributes_for :url_subscription, :reject_if => :all_blank, :allow_destroy => true

  has_one :email_subscription, :dependent => :destroy
  accepts_nested_attributes_for :email_subscription, :reject_if => :all_blank, :allow_destroy => true

  has_one :address_subscription, :dependent => :destroy
  accepts_nested_attributes_for :address_subscription, :reject_if => :all_blank, :allow_destroy => true

  has_one :opportunity_email_notification, :dependent => :destroy
  accepts_nested_attributes_for :opportunity_email_notification, :reject_if => :all_blank, :allow_destroy => true

  has_many :extended_subscriptions, :inverse_of => :opportunity, :dependent => :delete_all
  accepts_nested_attributes_for :extended_subscriptions, :reject_if => :all_blank, :allow_destroy => true

	has_many :grants, :inverse_of => :opportunity, :dependent => :delete_all
	accepts_nested_attributes_for :grants, :reject_if => :all_blank, :allow_destroy => true

  has_many :prizes, :inverse_of => :opportunity, :dependent => :delete_all
  accepts_nested_attributes_for :prizes, :reject_if => :all_blank, :allow_destroy => true

  has_many :docs, :inverse_of => :opportunity, :dependent => :delete_all
  accepts_nested_attributes_for :docs, :reject_if => :all_blank, :allow_destroy => true

	has_many :taxes, :dependent => :delete_all
	accepts_nested_attributes_for :taxes, :reject_if => :all_blank, :allow_destroy => true

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  enum entry_manner: { correios: 0, online: 1, email: 2, indicação: 3, não_definido: 4, correios_ou_internet: 5 }
  enum local_restriction: { nenhuma: 0, país: 1, estado: 2, município: 3}

  # is_impressionable :counter_cache => true, :column_name => :opportunity_views_counter_cache, :unique => true


  def list_categories
    self.category_list.present? ? self.category_list.take(4) : 'Categoria não informada'
  end

  def create_summary
    if self.content.present?
      self.summary = self.content.match(/^.{0,150}\b/)[0]
    end
  end

  def build_default_opportunity_email_notification
    build_opportunity_email_notification
  end

  def value_of_awards
    val = 0
    grants = self.grants
    grants.each do |grant|
      val += grant.prizes.map(&:value).inject(0, :+) * grant.quantity  unless grant.quantity.nil?
    end
    return val
  end

	def publish
		self.published_at = Time.zone.now
	end

	def unpublish
		self.published_at = nil
	end

  def likes_count
    likes.count
  end

end
