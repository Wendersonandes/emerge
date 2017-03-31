class AddPersonReferencesToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :person, index: true
  end
end
