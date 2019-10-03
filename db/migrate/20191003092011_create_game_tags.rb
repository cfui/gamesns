class CreateGameTags < ActiveRecord::Migration[5.2]
  def change
    create_table :game_tags do |t|

      t.timestamps
    end
  end
end
