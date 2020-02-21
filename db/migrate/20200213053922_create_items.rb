class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :item_text, null: false
      t.string :address, null: false
      t.string :date, null: false
      t.string :brand
      t.string :status
      t.integer :delivery_charge, null: false
      t.string :size
      t.integer :sold_out, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
