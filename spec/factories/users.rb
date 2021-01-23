FactoryBot.define do
  factory :user do
    nickname               { 'makoto' }
    email                  { Faker::Internet.free_email }
    password               { '123456abc' }
    password_confirmation  { '123456abc' }
    last_name              { '鈴木' }
    first_name             { '誠' }
    last_name_kana         { 'スズキ' }
    first_name_kana        { 'マコト' }
    birthday               { '1995-07-07' }
  end
end
