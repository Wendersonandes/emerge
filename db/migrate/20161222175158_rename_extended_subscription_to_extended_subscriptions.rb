class RenameExtendedSubscriptionToExtendedSubscriptions < ActiveRecord::Migration
  def change
	  rename_table :extended_subscription, :extended_subscriptions
  end
end
