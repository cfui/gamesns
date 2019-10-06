class RemoveProfireTextFromEnduser < ActiveRecord::Migration[5.2]
  def change
    remove_column :endusers, :profire_text, :text
  end
end
