# == Schema Information
#
# Table name: address_subscriptions
#
#  id             :integer          not null, primary key
#  address        :string
#  opportunity_id :integer
#

class AddressSubscription < ActiveRecord::Base
  belongs_to :opportunity
end
