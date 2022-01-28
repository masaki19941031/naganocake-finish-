class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ } #郵便番号ハイフンなし7桁
  validates :address, presence: true
  validates :name, presence: true
  
  def view_address
    "〒" + self.postcode + "　" + self.address + "　" + self.name
  end
  
end
