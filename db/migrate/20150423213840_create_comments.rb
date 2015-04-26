class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :author
      t.references :announcement, index: true, foreign_key: true

      t.timestamps null: false
    end
    # Tworzy index wg wartości announcement_id i created_at, co pozwoli wyświtlać je w określonej kolejności
    add_index :comments, [:announcement_id, :created_at]
  end
end
