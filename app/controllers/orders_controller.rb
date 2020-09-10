class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private

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

end
