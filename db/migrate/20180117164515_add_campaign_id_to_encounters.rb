class AddCampaignIdToEncounters < ActiveRecord::Migration[5.1]
  def change
    add_column :encounters, :campaign_id, :integer
  end
end
