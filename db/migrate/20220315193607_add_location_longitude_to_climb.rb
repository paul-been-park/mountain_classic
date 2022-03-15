class AddLocationLongitudeToClimb < ActiveRecord::Migration[6.0]
  def change
    add_column :climbs, :location_longitude, :float
  end
end
