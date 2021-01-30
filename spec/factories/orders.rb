FactoryBot.define do
  factory :order do
    number { '11111111111' }
    exp_month { '3' }
    exp_year { '33' }
    cvc { '123' }
    postal_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ビル' }
    phone_number { '01012345678' }
  end
end
