class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :school_desc
      t.string :bonus
      t.string :skills
      t.string :honor
      t.string :outfit
      t.string :school_class
      t.string :clan
      t.string :rank1_name
      t.string :rank1_desc
      t.string :rank2_name
      t.string :rank2_desc
      t.string :rank3_name
      t.string :rank3_desc
      t.string :rank4_name
      t.string :rank4_desc
      t.string :rank5_name
      t.string :rank5_desc
      t.string :affinity_deficiency
      t.string :spells
      t.string :special
      t.string :shugenja_tech_name
      t.string :shugenja_tech_desc

      t.timestamps null: false
    end
  end
end
