class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
    	# ユーザーが戻るをした後、もう一度フォームボタンを押した際に押した際に複数の部屋が作成される為、それの対策テーブル
      t.integer :enduser1_id
      t.integer :enduser2_id

      t.timestamps
    end
  end
end
