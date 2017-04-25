class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.integer :likeable_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
