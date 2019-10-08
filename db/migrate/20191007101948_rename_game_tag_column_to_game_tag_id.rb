class RenameGameTagColumnToGameTagId < ActiveRecord::Migration[5.2]
  def change
  	# リネームを試みるが直前にロールバックしていたためか、実行されず
  	rename_colimn :enduser_gametags, :game_tag, :game_tag_id
  end
end
