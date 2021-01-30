require 'rails_helper'
RSpec.describe Order, type: :model do
  describe '#order' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '商品購入ができる時' do
      it '全ての必須項目の記述が存在すれば購入できること' do
        expect(@order).to be_valid
      end
    end
  end
end
