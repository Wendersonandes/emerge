class AddRawPageSourceToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :raw_page_source, :text
  end
end
