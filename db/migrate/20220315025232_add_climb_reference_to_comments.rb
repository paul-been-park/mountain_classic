class AddClimbReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :climbs
    add_index :comments, :climb_id
    change_column_null :comments, :climb_id, false
  end
end
