class Plan < ApplicationRecord
  belongs_to :dear_person
  has_one :address
  has_one :payment
end
