class CreateAdvisorFlorists < ActiveRecord::Migration[6.0]
  def change
    create_table :advisor_florists do |t|
      t.string     :ad_florist,     null: false  
      t.references :dear_person, null: false,  foreign_key: true
      t.timestamps
    end
  end
end
