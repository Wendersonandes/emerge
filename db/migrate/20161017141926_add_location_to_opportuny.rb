class AddLocationToOpportuny < ActiveRecord::Migration
  def change
  	add_column :opportunities, :location, :string
  end
end
