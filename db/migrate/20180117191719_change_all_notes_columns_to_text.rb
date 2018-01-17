class ChangeAllNotesColumnsToText < ActiveRecord::Migration[5.1]
  def change
    change_column :campaigns, :notes, :text

    change_column :characters, :notes, :text

    change_column :characters, :stats, :text

    change_column :encounters, :notes, :text
  end
end
