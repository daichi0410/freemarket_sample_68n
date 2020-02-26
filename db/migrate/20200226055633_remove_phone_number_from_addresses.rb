class RemovePhoneNumberFromAddresses < ActiveRecord::Migration[5.2]

  def up
    remove_column :addresses, :phone_number, :integer
      end

  def down
    add_column :addresses, :phone_number, :string
  end

end
