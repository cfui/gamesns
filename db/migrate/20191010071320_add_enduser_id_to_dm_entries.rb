class AddEnduserIdToDmEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_entries, :enduser_id, :integer
  end
end
