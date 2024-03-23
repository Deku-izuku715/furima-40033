class BuyRecordesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(buy_record_params)
    if @order_form.valid?
      @order_form.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def buy_record_params
    params.require(:order_form).permit(:post_code, :prefecuture_id, :city, :street_address, :construction_name, :phone_number).merge(user_id: current_user.id)
  end
end