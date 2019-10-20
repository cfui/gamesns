class DropGameEvents < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_events
  end
end
