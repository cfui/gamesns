class Rocords < ActiveRecord::Migration[5.2]
  def change
  	# コメントのスペルが間違っていたので削除しようとしたが、削除できず
  	drop_table :post_coments
  end
end
