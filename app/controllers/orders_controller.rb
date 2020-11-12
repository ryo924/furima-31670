class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index, :create]
  before_action :move_to_root_path, only: :index

  def index
    @order_address = OrderAddress.new
    item_find
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    item_find
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
