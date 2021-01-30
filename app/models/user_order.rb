class UserOrder
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,
                :image, :name, :text, :category_id, :condition_id, :postage_id, :area_id, :day_id, :price, :postal_code, :area_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id

  # Addressモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Include half-width numbers' }
  end

  def save
    # ユーザーの情報を保存
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name,
                       first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birthday: birthday)
    # 商品の情報を保存
    Item.create(image: image, name: name, text: text, category_id: category_id, condition_id: condition_id,
                postage_id: postage_id, area_id: area_id, day_id: day_id, price: price, user_id: user_id)
    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
