# == Schema Information
#
# Table name: email_subscriptions
#
#  id             :integer          not null, primary key
#  email          :string
#  opportunity_id :integer
#

class EmailSubscription < ActiveRecord::Base
  belongs_to :opportunity
end
