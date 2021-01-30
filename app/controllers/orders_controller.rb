class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:user_order).permit(:postal_code, :area_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
