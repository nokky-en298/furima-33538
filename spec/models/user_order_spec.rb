require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  describe '#order' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入ができる時' do
      it '全ての必須項目の記述とtokenが存在すれば購入できること' do
        expect(@user_order).to be_valid
      end

      it '建物名は未入力でも購入できること' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが存在しないと購入できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが存在しないと購入できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idが存在しないと購入できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が入力されていないと購入できないこと' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県を選択していないと購入できないこと' do
        @user_order.area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Area Select')
      end

      it '市区町村を入力していないと購入できないこと' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地を入力していないと購入できないこと' do
        @user_order.block = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号を入力していないと購入できないこと' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は英数混合では購入できないこと' do
        @user_order.phone_number = '123456789abc'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid. Include half-width numbers')
      end

      it '電話番号は11桁以内でないと購入できないこと' do
        @user_order.phone_number = '123456789123'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid. Include half-width numbers')
      end
    end
  end
end
