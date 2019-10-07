class AddEnduserIdToEnduserGametags < ActiveRecord::Migration[5.2]
  def change
    add_column :enduser_gametags, :enduser_id, :integer
  end
end
