class Florist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bouquets
  has_many :favorite
  has_one_attached :avatar
  has_one :shop_address,  dependent: :destroy

  validates :avatar, presence: true
  validates :name, presence: true
end
