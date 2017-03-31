class AddCounterToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :likes_count, :integer, default: 0
  end
end
