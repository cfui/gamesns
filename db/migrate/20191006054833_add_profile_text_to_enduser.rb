class AddProfileTextToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :profile_text, :text
  end
end
