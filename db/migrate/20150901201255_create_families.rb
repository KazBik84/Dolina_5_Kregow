class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :mon_img
      t.string :desc
      t.string :name
      t.references :clan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
