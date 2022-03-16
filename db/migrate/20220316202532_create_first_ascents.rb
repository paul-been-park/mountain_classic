class CreateFirstAscents < ActiveRecord::Migration[6.0]
  def change
    create_table :first_ascents do |t|
      t.integer :legend_id
      t.integer :climb_id

      t.timestamps
    end
  end
end
