class CreateRoomLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :room_locations do |t|

      t.timestamps
    end
  end
end
