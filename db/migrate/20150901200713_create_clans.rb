class CreateClans < ActiveRecord::Migration
  def change
    create_table :clans do |t|
      t.string :mon_img
      t.string :desc
      t.string :name

      t.timestamps null: false
    end
  end
end
