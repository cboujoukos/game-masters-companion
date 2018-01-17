class AddNotesColumnToEncounters < ActiveRecord::Migration[5.1]
  def change
    add_column :encounters, :notes, :string
  end
end
