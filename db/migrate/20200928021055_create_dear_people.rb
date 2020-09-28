class CreateDearPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :dear_people do |t|
      t.string :nick_name,          null: false
      t.string :family_name,        null: false
      t.string :last_name,          null: false
      t.string :family_name_kana,   null: false
      t.string :last_name_kana,     null: false
      t.date :birthday,             null: false
      t.date :anniversary,          null: false
      t.references :user,           foreign_key: true,  null: false
      t.timestamps
    end
  end
end
