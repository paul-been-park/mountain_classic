class AddLocationFormattedAddressToClimb < ActiveRecord::Migration[6.0]
  def change
    add_column :climbs, :location_formatted_address, :string
  end
end
