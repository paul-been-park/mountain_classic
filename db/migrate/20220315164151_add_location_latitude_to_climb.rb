class AddLocationLatitudeToClimb < ActiveRecord::Migration[6.0]
  def change
    add_column :climbs, :location_latitude, :float
  end
end
