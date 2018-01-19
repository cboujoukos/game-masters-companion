class CorrectColumnNameInEnemies < ActiveRecord::Migration[5.1]
  def change
    rename_column :enemies, :campign_id, :campaign_id
  end
end
