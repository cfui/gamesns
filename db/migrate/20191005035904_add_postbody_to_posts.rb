class AddPostbodyToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :postbody, :text
  end
end
