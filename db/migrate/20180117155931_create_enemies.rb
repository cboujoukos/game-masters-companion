class CreateEnemies < ActiveRecord::Migration[5.1]
  def up
    create_table :enemies do |t|
      t.string :category
      t.integer :hp
      t.integer :ac
      t.string :notes
      t.string :damage
    end
  end

  def down
    drop_table :enemies
  end
end
