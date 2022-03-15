class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.string :tick
      t.string :summited
      t.integer :user_id
      t.integer :climb_id

      t.timestamps
    end
  end
end
