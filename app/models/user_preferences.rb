# == Schema Information
#
# Table name: user_preferences
#
#  id                              :integer          not null, primary key
#  user_id                         :integer
#  notify_on_new_opportunity       :boolean          default(TRUE), not null
#  send_daily_email                :boolean          default(TRUE), not null
#  send_weekly_email               :boolean          default(TRUE), not null
#  send_monthly_email              :boolean          default(TRUE), not null
#  notify_on_closing_opportunities :boolean          default(TRUE), not null
#  never_notify_me                 :boolean          default(FALSE), not null
#

class UserPreferences < ActiveRecord::Base
  belongs_to :user
end
