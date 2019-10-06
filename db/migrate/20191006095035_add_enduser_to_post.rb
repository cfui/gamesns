class AddEnduserToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :enduser, :integer
  end
end
