class AddStatsAndPpToEnemies < ActiveRecord::Migration[5.1]
  def change
    add_column :enemies, :passive_perception, :string
    add_column :enemies, :stats, :string
  end
end
