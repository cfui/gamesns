class AddGametagToEnduserGametag < ActiveRecord::Migration[5.2]
  def change
    add_column :enduser_gametags, :gametag, :string
  end
end
