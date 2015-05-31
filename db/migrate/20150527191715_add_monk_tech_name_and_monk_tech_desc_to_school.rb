class AddMonkTechNameAndMonkTechDescToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :monk_tech_name, :string
    add_column :schools, :monk_tech_desc, :string
  end
end
