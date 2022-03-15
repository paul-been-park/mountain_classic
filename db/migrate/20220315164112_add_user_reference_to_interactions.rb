class AddUserReferenceToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interactions, :users
    add_index :interactions, :user_id
    change_column_null :interactions, :user_id, false
  end
end
