class RenameProfileImageRenameToEndusers < ActiveRecord::Migration[5.2]
  def change
    rename_column :endusers, :profile_image, :profile_image_id
  end
end
