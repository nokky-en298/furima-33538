class UserOrder
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,
                :image, :name, :text, :category_id, :condition_id, :postage_id, :area_id, :day_id, :price, :postal_code, :area_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Include half-width numbers' }
  end

  def save
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name,
                       first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birthday: birthday)

    Item.create(image: image, name: name, text: text, category_id: category_id, condition_id: condition_id,
                postage_id: postage_id, area_id: area_id, day_id: day_id, price: price, user_id: user_id)

    order = Order.create(user_id: user_id, item_id: item_id, token: token)

    Address.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
