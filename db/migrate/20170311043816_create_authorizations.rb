class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :username, limit: 100
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end
