class AddCampaignIdToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :campaign_id, :integer
  end
end
