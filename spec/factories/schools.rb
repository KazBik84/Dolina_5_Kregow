  FactoryGirl.define do
  factory :school do
    name "MyString"
    school_desc "MyString"
    bonus "MyString"
    skills "MyString"
    honor "MyString"
    outfit "MyString"
    school_class "Bushi"
    clan "Smok"
    clan_name "Smok"
    rank1_name "MyString"
    rank1_desc "MyString"
    rank2_name "MyString"
    rank2_desc "MyString"
    rank3_name "MyString"
    rank3_desc "MyString"
    rank4_name "MyString"
    rank4_desc "MyString"
    rank5_name "MyString"
    rank5_desc "MyString"
    affinity_deficiency "MyString"
    spells "MyString"
    special "MyString"
    shugenja_tech_name "MyString"
    shugenja_tech_desc "MyString"
    monk_tech_name "MyString"
    monk_tech_desc "MyString"
    
    factory :school_class_primary do
      school_class "Dworzanin"
      affinity_deficiency nil
      spells nil
      shugenja_tech_name nil
      shugenja_tech_desc nil
      monk_tech_name nil
      monk_tech_desc nil
    end
    
    factory :shugenja_class_school do
      school_class "Shugenja"
      rank1_name nil
      rank1_desc nil
      rank2_name nil
      rank2_desc nil
      rank3_name nil
      rank3_desc nil
      rank4_name nil
      rank4_desc nil
      rank5_name nil
      rank5_desc nil
      affinity_deficiency "Stringi"
      spells "Stringi"
      shugenja_tech_name "Stringi"
      shugenja_tech_desc "Stringi"
    end
    
    factory :primary_monk_school do
      school_class "Mnich"
      monk_tech_name nil
      monk_tech_desc nil
    end 
    
    factory :order_of_shinsei_monk do
      school_class "Mnich"
      monk_tech_name "Stringi"
      monk_tech_desc "Stringi"
     rank1_name nil
      rank1_desc nil
      rank2_name nil
      rank2_desc nil
      rank3_name nil
      rank3_desc nil
      rank4_name nil
      rank4_desc nil
      rank5_name nil
      rank5_desc nil
      affinity_deficiency nil
      spells nil
      shugenja_tech_name nil
      shugenja_tech_desc nil      
    end
   
  end
end
