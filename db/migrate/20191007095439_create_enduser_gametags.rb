class CreateEnduserGametags < ActiveRecord::Migration[5.2]
  def change
    create_table :enduser_gametags do |t|

      t.timestamps
    end
  end
end
