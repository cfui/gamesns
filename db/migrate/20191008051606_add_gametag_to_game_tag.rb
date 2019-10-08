class AddGametagToGameTag < ActiveRecord::Migration[5.2]
  def change
    add_column :game_tags, :gametag, :string
  end
end
