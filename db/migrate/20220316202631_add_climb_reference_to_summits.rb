class AddClimbReferenceToSummits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :summits, :climbs
    add_index :summits, :climb_id
    change_column_null :summits, :climb_id, false
  end
end
