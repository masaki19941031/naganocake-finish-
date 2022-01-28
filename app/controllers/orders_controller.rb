class OrdersController < ApplicationController

def new
  @order = Order.new
  @addresses = current_customer.addresses
end

def confirm
  @order = Order.new(order_params)
  @cart_items = current_customer.cart_items
  @order.customer_id = current_customer.id
  @order.shipping_cost = 800
  @total_payment = @order.shipping_cost + @cart_items.items_of_price
  @registered_address = Address.where(customer_id: current_customer.id)
  
    if params[:delivery_address] == "0" 
          @delivery_postcode=current_customer.postcode
          @delivery_location= current_customer.address
          @delivery_name= current_customer.full_name
    elsif params[:delivery_address] == "1"
           @delivery_postcode=@registered_address.pluck(:postcode).slice!(0)
           @delivery_location= @registered_address.pluck(:address).slice!(0)
           @delivery_name=@registered_address.pluck(:name).slice!(0)
    elsif params[:delivery_address] == "2"
           @delivery_postcode= @order.postal_code
          @delivery_location= @order.address
           @delivery_name=  @order.name
    end

end

def create
 @order = Order.new(order_params)

 @cart_items = current_customer.cart_items
 if @order.save
   @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new
     @order_detail.order_id = @order.id
     @order_detail.item_id = cart_item.item.id
     @order_detail.amount = cart_item.amount
     @order_detail.price = cart_item.amount * cart_item.item.price
     @order_detail.save
   end
   @cart_items.destroy_all
   redirect_to complete_orders_path

 else
   render :new
 end


end

def complete
  cart_items = current_customer.cart_items
  cart_items.destroy_all
end

def index
  @cart_items= CartItem.all  
  @orders = current_customer.orders.page(params[:page]).per(5).reverse_order
end

def show
@order=Order.find(params[:id])
@order_details = @order.order_details


end


private

def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
end



end