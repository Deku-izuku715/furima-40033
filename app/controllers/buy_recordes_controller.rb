class BuyRecordesController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end