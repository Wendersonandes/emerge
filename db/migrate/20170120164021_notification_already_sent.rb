class NotificationAlreadySent < ActiveRecord::Migration
  def change
    add_column :opportunities, :notification_already_sent, :boolean, null: false, default: false

    execute "UPDATE opportunities SET notification_already_sent = true where created_at::date <= ('2017-01-15'::date)"
  end
end
