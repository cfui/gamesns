class AddProfileImageToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :profile_image, :string
  end
end
