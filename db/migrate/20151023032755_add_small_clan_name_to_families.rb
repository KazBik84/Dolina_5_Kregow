class AddSmallClanNameToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :small_clan_name, :string
  end
end
