class CreateBouquets < ActiveRecord::Migration[6.0]
  def change
    create_table :bouquets do |t|
      t.string :style,           null: false
      t.text :commentary,        null: false
      t.references :florist,     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
