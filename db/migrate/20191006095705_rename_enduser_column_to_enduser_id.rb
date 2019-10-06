class RenameEnduserColumnToEnduserId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :enduser, :enduser_id
  end
end
