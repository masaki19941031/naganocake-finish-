class Admins::OrdersController < ApplicationController

before_action :authenticate_admin!

  def index
   @orders = Order.page(params[:page]).per(10).reverse_order
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
    @order_details.each do |order_detail| 
      if order_detail.making_status == "製作不可"
        @condition_detail = order_detail.making_status == "製作不可"
      elsif @order.order_details.count == @order.order_details.where(making_status: 3).count
        @condition_detail = order_detail.making_status == "製作完了"
      end
    end
    
    if @order.status == "入金確認"
      @condition_order = @order.status == "入金確認"
    elsif @order.status == "製作中"
      @condition_order = @order.status == "製作中"
    elsif @order.status == "発送済み"
      @condition_order = @order.status == "発送済み"
      
    end
  end
  
  
  def update
    @order = Order.find(params[:id])
    @order_status = params[:order][:order_status].to_i
    @order.update(status: @order_status)
    
    if @order_status == 1
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
    redirect_to   admins_order_path(@order)
  end


end