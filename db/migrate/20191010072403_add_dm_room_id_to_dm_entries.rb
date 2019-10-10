class AddDmRoomIdToDmEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_entries, :dm_room, :integer
  end
end
