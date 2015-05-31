class AddImgNameToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :img_name, :string
  end
end
