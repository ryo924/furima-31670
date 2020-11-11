class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
