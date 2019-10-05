class RemovePostFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :name, :text
  end
end
