class RenameGametagColumnToEnduserGametags < ActiveRecord::Migration[5.2]
  def change
  	rename_column :enduser_gametags, :gametag, :tag_name
  end
end
