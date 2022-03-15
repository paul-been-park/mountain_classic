class AddRegionReferenceToMountains < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :mountains, :regions
    add_index :mountains, :region_id
    change_column_null :mountains, :region_id, false
  end
end
