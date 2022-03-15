class AddMountainReferenceToClimbs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :climbs, :mountains
    add_index :climbs, :mountain_id
    change_column_null :climbs, :mountain_id, false
  end
end
