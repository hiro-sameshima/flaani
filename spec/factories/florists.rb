FactoryBot.define do
  factory :florist do
    name             {Faker::Name.initials(number: 16)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end