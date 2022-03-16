class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.integer :user_id
      t.integer :climb_id

      t.timestamps
    end
  end
end
