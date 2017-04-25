# == Schema Information
#
# Table name: url_subscriptions
#
#  id             :integer          not null, primary key
#  url            :string
#  opportunity_id :integer
#

class UrlSubscription < ActiveRecord::Base
  belongs_to :opportunity
end
