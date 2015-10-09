class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :families, :clan, :clan_name
  end
end
