class CreateCharacters < ActiveRecord::Migration[5.1]
  def up
    create_table :characters do |t|
      t.boolean :is_player
      t.string :name
      t.string :notes
      t.integer :ac
      t.integer :hp
      t.integer :xp
      t.string :stats
      t.integer :passive_perception
    end
  end
  
  def down
    drop_table :characters
  end
end
