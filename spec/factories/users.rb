FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'asd1234' }
    password_confirmation { password }
    family_name           { 'あいうえお' }
    last_name             { 'あいうえお' }
    family_name_kana      { 'アイウエオ' }
    last_name_kana        { 'アイウエオ' }
    birthday              { '2021-07-15' }
  end
end
