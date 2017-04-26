class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :title, :beginning, :end_subscription, :result, :extended, :created_at, :updated_at, :author_id, :entry_manner, :local_restriction,
              :opportunity_views_counter_cache, :url_source, :featured_image_data, :published_at, :email_contact, :ongoing, :prospectus_url, :scrapper_source,
              :original_source_id, :location, :content, :summary, :raw_page_source, :notification_already_sent, :likes_count

  has_one :url_subscription
  has_one :email_subscription
  has_one :address_subscription
  has_one :opportunity_email_notification
  has_many :extended_subscriptions
<<<<<<< HEAD
	has_many :grants
  has_many :prizes
  has_many :docs, :inverse_of => :opportunity, :dependent => :delete_all
=======
	# has_many :grants
  has_many :prizes
  # has_many :docs, :inverse_of => :opportunity, :dependent => :delete_all
>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
	has_many :taxes
  has_many :likes, as: :likeable, dependent: :destroy
  # has_many :likers, through: :likes, source: :user

<<<<<<< HEAD
=======


>>>>>>> 6994ff6f1422d2c923e04ee309b097f09ef708df
end
