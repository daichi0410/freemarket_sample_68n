class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null:false
      t.string :last_name, null:false
      t.string :j_family_name,null:false
      t.string :j_last_name, null:false
      t.string :postal_code,null:false
      t.string :prefectures,null:false
      t.string :municipality,null:false
      t.string :number, null:false
      t.string :details
      t.integer :phone_number,null:false
      t.references :user
      t.timestamps
    end

    add_index :addresses, :phone_number,                unique: true

  end
end
