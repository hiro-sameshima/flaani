class Address < ApplicationRecord
  # アクティブハッシュを使用する際のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

  belongs_to :dear_person
  belongs_to :plan, optional: true
  belongs_to :address, optional: true
end
