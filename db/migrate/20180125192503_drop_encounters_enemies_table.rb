class DropEncountersEnemiesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :encounters_enemies
  end
end
