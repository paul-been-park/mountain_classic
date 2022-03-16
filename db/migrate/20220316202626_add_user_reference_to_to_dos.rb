class AddUserReferenceToToDos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :to_dos, :users
    add_index :to_dos, :user_id
    change_column_null :to_dos, :user_id, false
  end
end
