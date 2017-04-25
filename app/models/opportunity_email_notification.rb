# == Schema Information
#
# Table name: opportunity_email_notifications
#
#  id               :integer          not null, primary key
#  opportunity_id   :integer
#  closure          :boolean          default(FALSE)
#  recent_added     :boolean          default(FALSE)
#  follower_closure :boolean          default(FALSE)
#  created_at       :datetime
#  updated_at       :datetime
#

class OpportunityEmailNotification < ActiveRecord::Base
	belongs_to :opportunity, :inverse_of => :opportunities

  def update_recently_added
    update_column(:recent_added, true)
  end

  def update_closure
    update_column(:closure, true)
  end

  def update_follower_closure
    update_column(:follower_closure, true)
  end

end
