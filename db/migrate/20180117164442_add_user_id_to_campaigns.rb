class AddUserIdToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :user_id, :integer
  end
end
