class Payment < ApplicationRecord
  belongs_to :plan, optional: true
end
