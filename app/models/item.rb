class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, :text
    validates :price format: ( with: "/^[0-9]+$/", greater_than_or_equal_to: 300, less_than_or_equal_to:9999999, message: 'Price Half-width number')
    validates :image format: 
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :day_id
  end
end
