class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :mon_img
      t.string :desc
      t.string :name
      t.string :clan
      t.string :bonus

      t.timestamps null: false
    end
  end
end
