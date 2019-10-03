class CreateDmMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :dm_messages do |t|

      t.timestamps
    end
  end
end
