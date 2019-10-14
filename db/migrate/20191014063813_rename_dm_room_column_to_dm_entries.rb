class RenameDmRoomColumnToDmEntries < ActiveRecord::Migration[5.2]
  def change
  	rename_column :dm_entries, :dm_room, :dm_room_id
  end
end
