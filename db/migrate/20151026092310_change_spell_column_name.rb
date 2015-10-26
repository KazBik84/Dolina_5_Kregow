class ChangeSpellColumnName < ActiveRecord::Migration
  def change
    rename_column :spells, :nazwa, :name    
  end
end
