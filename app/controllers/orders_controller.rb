class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:token, :item_id, :user_id, :item_price)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index2
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_57ca6f9bfe5769a11edb9e58"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
