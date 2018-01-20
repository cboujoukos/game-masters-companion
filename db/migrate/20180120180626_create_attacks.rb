class CreateAttacks < ActiveRecord::Migration[5.1]
  def up
    create_table :attacks do |t|
      t.string :name
      t.string :to_hit
      t.string :damage
      t.integer :character_id
    end
  end
end
