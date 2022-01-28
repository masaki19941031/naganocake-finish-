class Admins::OrderDetailsController < ApplicationController
  
   before_action :authenticate_admin!
   
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail_status = params[:order_detail][:making_status].to_i
    @order_detail.update(making_status: @order_detail_status)
    @order = @order_detail.order
    @order_details = OrderDetail.all
    
    if @order_detail_status == 2
      @order_detail.order.update(status: 2)
    elsif @order.order_details.count == @order.order_details.where(making_status: 3).count
      @order_detail.order.update(status: 3)
    end
    redirect_to admins_order_path(@order_detail.order)
  end
end