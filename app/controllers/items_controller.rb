class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path
    else
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :item_describe, :category_id, :condition_id, :send_cost_id, :prefecture_id, :arrive_day_id, :image).merge(user_id: current_user.id)
  end
end