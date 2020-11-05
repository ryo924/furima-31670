class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    if user_signed_in?
      @item
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
