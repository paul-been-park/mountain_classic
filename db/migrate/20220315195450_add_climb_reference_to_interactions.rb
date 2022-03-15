class AddClimbReferenceToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interactions, :climbs
    add_index :interactions, :climb_id
    change_column_null :interactions, :climb_id, false
  end
end
