class Plan < ApplicationRecord
  has_one :address
  has_one :payment
end
