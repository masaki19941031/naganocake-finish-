class ItemsController < ApplicationController
  before_action :authenticate_customer!,except:[:index, :show]

  def top
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def about
  end

  def index
    @items = Item.all
    @items = Item.page(params[:page]).reverse_order
  end
  
end
