class AddClimbReferenceToToDos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :to_dos, :climbs
    add_index :to_dos, :climb_id
    change_column_null :to_dos, :climb_id, false
  end
end
