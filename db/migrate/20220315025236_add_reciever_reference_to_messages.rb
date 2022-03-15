class AddRecieverReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :reciever_id
    add_index :messages, :reciever_id
    change_column_null :messages, :reciever_id, false
  end
end
