class Records < ActiveRecord::Migration[5.2]
  def change
  	# 不要になったgame_tagsテーブルを削除
  	drop_table :game_tags
  end
end
