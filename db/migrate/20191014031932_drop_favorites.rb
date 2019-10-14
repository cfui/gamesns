class DropFavorites < ActiveRecord::Migration[5.2]
  def change
  	# 不要テーブルを削除しようとしたが、削除されず
  	drop_table :favorites
  end
end
