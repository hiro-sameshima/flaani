class Favorite < ApplicationRecord
  belongs_to :florist
  belongs_to :dear_person
end
