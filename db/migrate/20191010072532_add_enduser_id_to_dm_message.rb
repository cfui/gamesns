class AddEnduserIdToDmMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_messages, :enduser_id, :integer
  end
end
