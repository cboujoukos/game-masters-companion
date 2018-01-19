class AddCrColumnToEnemies < ActiveRecord::Migration[5.1]
  def change
    add_column :enemies, :cr, :string
  end
end
