class CreateDmEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :dm_entries do |t|

      t.timestamps
    end
  end
end
