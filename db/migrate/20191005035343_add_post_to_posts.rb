class AddPostToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :name, :text
  end
end
