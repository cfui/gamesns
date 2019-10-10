class AddDmRoomIdToDmMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_messages, :dm_room_id, :integer
  end
end
