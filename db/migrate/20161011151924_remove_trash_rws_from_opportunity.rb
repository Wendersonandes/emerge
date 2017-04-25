class RemoveTrashRwsFromOpportunity < ActiveRecord::Migration
  def change
  	remove_column :opportunities , :status
  	remove_column :opportunities , :program_id
  	remove_column :opportunities , :rules
  end
end
