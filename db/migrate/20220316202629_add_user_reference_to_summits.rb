class AddUserReferenceToSummits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :summits, :users
    add_index :summits, :user_id
    change_column_null :summits, :user_id, false
  end
end
