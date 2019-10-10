class DropRoomLocations < ActiveRecord::Migration[5.2]
  def change
  	# room_locationsという名前が分かりにくいため、代わりに新しくファイルを作るために削除
  	drop_table :room_locations
  end
end
