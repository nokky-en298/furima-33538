class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name, :text
    validates :price,
              numericality: { with: /^[0-9]+$/, message: 'Half-width number / Out of setting range', greater_than_or_equal_to: 300,
                              less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :day_id
  end
end
