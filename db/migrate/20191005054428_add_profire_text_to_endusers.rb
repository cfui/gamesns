class AddProfireTextToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :profire_text, :text
  end
end
