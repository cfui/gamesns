class AddNicknameToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :nickname, :string
  end
end
