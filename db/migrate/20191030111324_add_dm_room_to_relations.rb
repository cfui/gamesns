class AddDmRoomToRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :relations, :dm_room_id, :integer
  end
end
