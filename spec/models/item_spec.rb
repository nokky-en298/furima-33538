require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it '全ての項目の記述が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it '出品画像が無いと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無いと登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が無いと登録できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが選択されていないと登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'カテゴリーが---では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品の状態が選択されていないと登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '商品の状態が---では登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担が選択されていないと登録できないこと' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage Select')
      end

      it '商品の状態が---では登録できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage Select')
      end

      it '発送元の地域が選択されていないと登録できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end

      it '発送元の地域が---では登録できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end

      it '発送までの日数が選択されていないと登録できないこと' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it '発送までの日数が---では登録できないこと' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end

      it '販売価格の入力がないと登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Half-width number / Out of setting range')
      end

      it '販売価格の範囲が、¥300~¥9,999,999の間の設定でないと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number / Out of setting range')
      end

      it '販売価格の範囲が、¥300~¥9,999,999の間の設定でないと登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number / Out of setting range')  
      end
    end
  end
end
