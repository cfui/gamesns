class RemoveGameTagIdFromEnduserGametag < ActiveRecord::Migration[5.2]
  def change
    remove_column :enduser_gametags, :game_tag_id, :integer
  end
end
