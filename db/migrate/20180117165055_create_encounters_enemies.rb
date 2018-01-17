class CreateEncountersEnemies < ActiveRecord::Migration[5.1]
  def up
    create_table :encounters_enemies do |t|
      t.integer :encounter_id
      t.integer :enemy_id
    end
  end

  def down
    drop_table :encounters_enemies
  end
end
