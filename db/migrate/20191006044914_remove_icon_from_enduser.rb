class RemoveIconFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :icon, :string
  end
end
