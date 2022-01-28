class Item < ApplicationRecord
 attachment :image
 has_many :cart_items, dependent: :destroy
 belongs_to :genre, class_name: 'Genre', foreign_key: 'genre_id'
 has_many :order_details, dependent: :destroy
 

 validates :name, presence: true
 validates :introduction, presence: true
 validates :price, presence: true
 validates :is_active, presence: true

  def add_tax_price
   (self.price / 1.08).round
  end
  
  def self.search_for(content, method)
    if method == "perfect"
      Item.where(name: content)
    else
      Item.where("name LIKE ?", "%" + content + "%")
    end
  end
end
