class OpportunitySerializer < ActiveModel::Serializer
  attributes	:id,
							:title,
							:beginning,
							:end_subscription,
							:result,
							:extended,
							:created_at,
							:updated_at,
							:author_id,
							:entry_manner,
							:local_restriction,
              :opportunity_views_counter_cache,
							:url_source,
							:featured_image_data,
							:published_at,
							:email_contact,
							:ongoing,
							:prospectus_url,
							:scrapper_source,
              :original_source_id,
							:location,
							:content,
							:summary,
							:raw_page_source,
							:notification_already_sent,
							:likes_count,
              :followers_count

  has_one		:opportunity_email_notification
  has_many	:extended_subscriptions
	has_many	:grants
  has_many	:docs, :inverse_of => :opportunity, :dependent => :delete_all
	has_many :taxes
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :followers, polymorphic: true
  # has_many :likers, through: :likes, source: :user

  def followers_count
    object.followers_count
  end

end
