FactoryBot.define do 
  factory :item do
    name                  { '夜空' }
    text                  { 'きれい' }
    category_id           {2}
    condition_id          {2}
    postage_id            {2}
    area_id               {2}
    day_id                {2}
    price                 {500}
    
   association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
