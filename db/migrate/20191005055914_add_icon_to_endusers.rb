class AddIconToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :icon, :string
  end
end
