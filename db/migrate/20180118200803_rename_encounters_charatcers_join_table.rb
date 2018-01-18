class RenameEncountersCharatcersJoinTable < ActiveRecord::Migration[5.1]
  def up
    rename_table :encounters_characters, :characters_encounters
  end

  def down
    rename_table :characters_encounters, :encounters_characters
  end
end
