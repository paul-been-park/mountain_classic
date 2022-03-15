class CreateLegends < ActiveRecord::Migration[6.0]
  def change
    create_table :legends do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
