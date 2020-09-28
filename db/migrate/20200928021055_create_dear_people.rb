class CreateDearPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :dear_people do |t|

      t.timestamps
    end
  end
end
