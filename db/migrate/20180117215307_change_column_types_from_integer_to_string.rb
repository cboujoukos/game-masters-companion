class ChangeColumnTypesFromIntegerToString < ActiveRecord::Migration[5.1]
  def change
    change_column :characters, :ac, :string

    change_column :characters, :hp, :string

    change_column :characters, :xp, :string

    change_column :characters, :passive_perception, :string

    change_column :enemies, :hp, :string

    change_column :enemies, :ac, :string
  end
end
