class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :price,                null: false,  foreign_key: true
      t.references :user,                 null: false,  foreign_key: true
      t.references :dear_person,          null: false,  foreign_key: true
      t.timestamps
    end
  end
end
