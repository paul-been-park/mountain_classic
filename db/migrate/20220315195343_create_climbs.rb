class CreateClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :climbs do |t|
      t.string :route_name
      t.string :length
      t.string :grade
      t.string :guide_url
      t.string :climb_photo
      t.integer :mountain_id
      t.string :description
      t.string :classic
      t.string :location

      t.timestamps
    end
  end
end
