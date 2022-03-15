class AddClimbReferenceToFirstAscents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :first_ascents, :climbs
    add_index :first_ascents, :climb_id
    change_column_null :first_ascents, :climb_id, false
  end
end
