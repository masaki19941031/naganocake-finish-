class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :customer_id, null: false


      t.timestamps
    end
  end
end
