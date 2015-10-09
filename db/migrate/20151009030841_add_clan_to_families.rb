class AddClanToFamilies < ActiveRecord::Migration
  def change
    add_reference :families, :clan, index: true, foreign_key: true
  end
end
