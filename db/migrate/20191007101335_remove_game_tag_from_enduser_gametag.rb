class RemoveGameTagFromEnduserGametag < ActiveRecord::Migration[5.2]
  def change
    remove_column :enduser_gametags, :game_tag, :integer
  end
end
