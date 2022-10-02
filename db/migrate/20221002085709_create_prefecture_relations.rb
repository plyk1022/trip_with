class CreatePrefectureRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :prefecture_relations do |t|
      t.integer :post_id, null: false
      t.integer :prefecture_id, null: false

      t.timestamps
    end
  end
end
