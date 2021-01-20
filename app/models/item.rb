class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :day_id
    validates :price
    validates :image
  end
end
