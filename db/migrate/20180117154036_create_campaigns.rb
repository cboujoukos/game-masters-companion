class CreateCampaigns < ActiveRecord::Migration[5.1]
  def up
    create_table :campaigns do |t|
      t.string :name
      t.string :setting
    end
  end

  def down
    drop_table :campaigns
  end
end
