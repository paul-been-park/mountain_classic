class CreateMountains < ActiveRecord::Migration[6.0]
  def change
    create_table :mountains do |t|
      t.integer :region_id
      t.string :mountain_name

      t.timestamps
    end
  end
end
