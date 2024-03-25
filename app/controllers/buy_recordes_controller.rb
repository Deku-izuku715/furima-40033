class BuyRecordesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(buy_record_params)
    if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_record_params[:token],
        currency: 'jpy'
      )
      @order_form.save(params,current_user.id)
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def buy_record_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :street_address, :construction_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def prevent_url
    if @item.user_id == current_user.id || @item.buy_record != nil
      redirect_to root_path
    end
  end
end