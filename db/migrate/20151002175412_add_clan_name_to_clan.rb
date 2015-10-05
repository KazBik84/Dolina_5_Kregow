class AddClanNameToClan < ActiveRecord::Migration
  def change
    add_column :clans, :clan_name, :string
  end
end
