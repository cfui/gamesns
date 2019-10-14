class AddRoomNameToDmRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_rooms, :room_name, :string
  end
end
