class ShopAddress < ApplicationRecord
  # アクティブハッシュを使用する際のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :florist  # floristテーブルとのアソシエーション
  has_one_attached :image # 各画像と1対1で結びつける

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :shop_name
    validates :email
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is enter the phone number in 10 or 11 digits, half-width numbers.' }
  end
end
