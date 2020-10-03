class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      # テーブルの記述から
      t.integer :price,           null: false
      t.string :style,            null: false
      t.references :dear_person,  null: false,  foreign_key: true
      t.timestamps
    end
  end
end
