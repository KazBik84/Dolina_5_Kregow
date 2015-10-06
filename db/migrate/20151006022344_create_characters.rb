class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :clan
      t.string :desc
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
