class ChangeColumnsInCharacters < ActiveRecord::Migration[5.1]
  def change
    remove_column :characters, :is_player

    add_column :characters, :category, :string

    add_column :characters, :cr, :string
  end
end
