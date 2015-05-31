class AddClanNameToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :clan_name, :string
  end
end
