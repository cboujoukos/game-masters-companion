class AddCampaignIdToEnemies < ActiveRecord::Migration[5.1]
  def change
    add_column :enemies, :campign_id, :integer
  end
end
