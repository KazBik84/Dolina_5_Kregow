class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :zywiol
      t.string :krag
      t.string :nazwa
      t.string :img_name
      t.string :obszar
      t.string :zasieg
      t.string :opis
      t.string :podbicia
      t.string :specjalne
      t.text :tagi, array: true, default: []

      t.timestamps null: false
    end
  end
end
