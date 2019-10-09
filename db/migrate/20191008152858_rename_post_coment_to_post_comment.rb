class RenamePostComentToPostComment < ActiveRecord::Migration[5.2]
  def change
  	# コメントのスペルが間違っていた為、変更しようとしたが変更できず
  	rename_table :post_coments, :post_comments
  end
end
