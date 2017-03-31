class AddEmailContactToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :ongoing, :boolean, :default => false, :null => false
    add_column :opportunities, :email_contact, :string
    add_column :opportunities, :prospectus_url, :string
  end
end
