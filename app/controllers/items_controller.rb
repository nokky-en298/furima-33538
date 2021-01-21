class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @items = Item.includes(:user)
  end

  def new
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :postage_id, :area_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
