class CreateEncounters < ActiveRecord::Migration[5.1]
  def up
    create_table :encounters do |t|
      t.string :loot
    end
  end
  def down
    drop_table :encounters
  end
end
