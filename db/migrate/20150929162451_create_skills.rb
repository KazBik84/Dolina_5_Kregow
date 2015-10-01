class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :name_pl
      t.text :sub_typ, array: true, default: []
      t.string :attr
      t.text :sphare, array: true, default: []
      t.string :emphases
      t.string :desc
      t.string :master

      t.timestamps null: false
    end
  end
end
