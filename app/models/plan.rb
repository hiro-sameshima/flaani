class Plan < ApplicationRecord
  belongs_to :dear_person
  has_one :address
  has_one :payment

  with_options presence: true do
    validates :style
    validates :price
  end    
end
