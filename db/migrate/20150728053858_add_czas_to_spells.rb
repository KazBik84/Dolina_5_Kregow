class AddCzasToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :czas, :string
  end
end
