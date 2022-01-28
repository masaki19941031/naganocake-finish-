class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre_id, null: false
      t.string :name,         null: false
      t.string :image_id,     null: false
      t.text :introduction,   null: false
      t.integer :price,       null: false
      t.boolean :is_active,   null: false
      t.timestamps
    end
  end
end
