class ChangeLocationDefaultValueInClimbs < ActiveRecord::Migration[6.0]
  def change
    change_column_default :climbs, :location,
                          "39.885562545597054, -102.21744824588404"
  end
end
