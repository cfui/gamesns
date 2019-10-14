class AddContentToDmMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :dm_messages, :content, :text
  end
end
