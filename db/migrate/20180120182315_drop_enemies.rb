class DropEnemies < ActiveRecord::Migration[5.1]
  def change
    drop_table :enemies
  end
end
