class CreateEntryManners < ActiveRecord::Migration
  def change
    create_table :entry_manners do |t|
      t.integer :entry_type
      t.references :opportunity, index: true, foreign_key: true
      t.string :content
    end
  end
end
