FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ビル' }
    phone_number { '01012345678' }
  end
end
