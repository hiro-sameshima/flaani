class Bouquet < ApplicationRecord
  belongs_to :florist  # usersテーブルとのアソシエーション
  has_one_attached :image # 各画像と1対1で結びつける

  with_options presence: true do
    validates :style
    validates :commentary
    validates :image
  end
end
