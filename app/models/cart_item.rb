class CartItem < ApplicationRecord
  
    belongs_to :customer
    belongs_to :item
    

    validates :amount, numericality:{ only_integer: true }, presence: true

    def sum_of_price
      item.price * amount
    end
    
    
    scope :items_of_price, -> { inject(0){ |sum, item| sum + item.sum_of_price } }
    
end
