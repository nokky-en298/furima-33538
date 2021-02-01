class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Include half-width numbers' }
    validates :item_id, :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)

    Address.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
