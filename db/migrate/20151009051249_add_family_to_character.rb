class AddFamilyToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :family, :string
  end
end
