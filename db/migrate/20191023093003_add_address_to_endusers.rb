class AddAddressToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :address, :string
  end
end
