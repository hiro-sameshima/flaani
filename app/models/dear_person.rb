class DearPerson < ApplicationRecord
  belongs_to :user  # usersテーブルとのアソシエーション
  has_one_attached :image # 各画像と1対1で結びつける
  has_one :shopping
  # 空だと登録できないバリデーション
  with_options presence: true do
    validates :nick_name
    validates :image
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
