class AddLegendReferenceToFirstAscents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :first_ascents, :legends
    add_index :first_ascents, :legend_id
    change_column_null :first_ascents, :legend_id, false
  end
end
