class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :schedule_id, null: false
      t.string :name, null: false
      t.text :comment, null: false
      t.time :arriving_time
      t.time :leaving_time

      t.timestamps
    end
  end
end
