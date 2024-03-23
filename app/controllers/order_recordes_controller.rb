class OrderRecordesController < ApplicationController
  def index@item = Item.find(params[:item_id])
    @order_recodform = OrderRecord.new
  end
end