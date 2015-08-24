class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :kind
      t.string :name
      t.string :name_pl
      t.string :sphere
      t.string :desc
      t.text :value, array: true, default: []

      t.timestamps null: false
    end
  end
end
