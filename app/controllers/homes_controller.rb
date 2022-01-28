class HomesController < ApplicationController
  def top
    @items = Item.limit(5).order("created_at DESC")
    
  end

  def about
  end
end
