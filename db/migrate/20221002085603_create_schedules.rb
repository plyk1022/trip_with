class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :post_id, null: false
      t.date :day, null: false

      t.timestamps
    end
  end
end
