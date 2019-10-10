class AddPostIdToEnduserGametags < ActiveRecord::Migration[5.2]
  def change
    add_column :enduser_gametags, :post_id, :integer
  end
end
