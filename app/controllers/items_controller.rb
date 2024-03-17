class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    #@item = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def item_params
    params.require(:item).permit(:item_name, :price, :item_describe, :category_id, :condition_id, :send_cost_id, :prefecture_id, :arrive_day_id, :image).merge(user_id: current_user.id)
  end
end