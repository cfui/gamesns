class CreateGameEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :game_events do |t|

      t.timestamps
    end
  end
end
