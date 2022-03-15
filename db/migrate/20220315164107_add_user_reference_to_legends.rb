class AddUserReferenceToLegends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :legends, :users
    add_index :legends, :user_id
  end
end
