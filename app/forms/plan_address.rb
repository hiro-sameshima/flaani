class PlanAddress
  include ActiveModel::Model
  # attr_accessor :style, :price,:dear_person_id , :postal_code, :prefecture_id, :city, :house_number, :building_name,:phone_number, :delivery_time_id, :dear_person, :price, :authenticity_token ,:plan
  attr_accessor :style, :price, :dear_person_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :delivery_time_id, :dear_person, :price, :token, :user_id

  with_options presence: true do
    validates :token, presence: { message: 'can\'t be blank' }
    validates :style
    validates :price
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is enter the phone number in 10 or 11 digits, half-width numbers.' }
    # 「金額」に関するバリデーション
    validates :price
  end
  # 「都道府県に関するバリデーション」
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  # 「配達時間に関するバリデーション」
  validates :delivery_time_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    # プランの情報を保存し、「plan」という変数に入れている
    plan = Plan.create(price: price, style: style, dear_person_id: dear_person_id)

    payment = Payment.create!(price: price, user_id: user_id)
    address = Address.create!(
      postal_code: postal_code,
      city: city,
      house_number: house_number,
      building_name: building_name,
      prefecture_id: prefecture_id,
      phone_number: phone_number,
      delivery_time_id: delivery_time_id,
      dear_person_id: dear_person_id
    )
  end
end
