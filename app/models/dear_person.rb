class DearPerson < ApplicationRecord

  belongs_to :user  # usersテーブルとのアソシエーション

  validates :text, presence: true # 空だと登録できないバリデーション
end
