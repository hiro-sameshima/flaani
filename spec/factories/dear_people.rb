FactoryBot.define do
  factory :dear_person do
    transient do
      person { Gimei.name }
   end
    nick_name                  {person.first.kanji}
    family_name                {person.first.kanji}
    last_name                  {person.last.kanji}
    family_name_kana           {person.first.katakana}
    last_name_kana             {person.last.katakana}
    birthday                   { Faker::Date.backward }
    anniversary                { Faker::Date.backward }
    association :user
  end
end
