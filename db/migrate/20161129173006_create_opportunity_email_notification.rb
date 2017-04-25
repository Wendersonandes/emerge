class CreateOpportunityEmailNotification < ActiveRecord::Migration
  def change
    create_table :opportunity_email_notifications do |t|
    	t.references :opportunity, index: true, foreign_key: true
    	t.boolean :closure, :default => false
    	t.boolean :recent_added, :default => false
    	t.boolean :follower_closure, :default => false
    	t.timestamps
    end
  end
end
