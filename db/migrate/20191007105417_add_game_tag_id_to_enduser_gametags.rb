class AddGameTagIdToEnduserGametags < ActiveRecord::Migration[5.2]
  def change
    add_column :enduser_gametags, :game_tag_id, :integer
  end
end
