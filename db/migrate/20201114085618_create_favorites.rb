class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :florist, null: false, foreign_key: true
      t.references :dear_person, null: false, foreign_key: true

      t.timestamps
      t.index [:florist_id, :dear_person_id], unique: true
    end
  end
end
