class RemovePostIdFromEnduserGametags < ActiveRecord::Migration[5.2]
  def change
    remove_column :enduser_gametags, :post_id, :integer
  end
end
