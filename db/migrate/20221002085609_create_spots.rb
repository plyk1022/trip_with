class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :schedule_id, null: false
      t.string :name, null: false
      t.text :comment, null: false
      t.time :arriving_time, null: false
      t.time :learving_time, null: false

      t.timestamps
    end
  end
end
