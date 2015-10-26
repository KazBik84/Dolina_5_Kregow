require 'rails_helper'

RSpec.describe School, type: :model do
  it "has valid factory" do
    expect(build(:school)).to be_valid 
  end
  
  it "is invalid with blank name " do
  	expect(build(:school, name: nil )).to_not be_valid
  end	
  
  it "is invalid with blank school_desc " do
  	expect(build(:school, school_desc: nil )).to_not be_valid
  end	

  it "is invalid with blank bonus " do
  	expect(build(:school, bonus: nil )).to_not be_valid
  end	  

  it "is invalid with blank skills " do
  	expect(build(:school, skills: nil )).to_not be_valid
  end	

  it "is invalid with blank honor " do
  	expect(build(:school, honor: nil )).to_not be_valid
  end	

  it "is invalid with blank outfit " do
  	expect(build(:school, outfit: nil )).to_not be_valid
  end	

  it "is invalid with blank school_class " do
  	expect(build(:school, school_class: nil )).to_not be_valid
  end

  it "is invalid with school_class other then specyfi " do
  	expect(build(:school, school_class: "Nikt" )).to_not be_valid
  end
  
  it "is valid with proper school_class value" do
    proper_school_class = ["Bushi", "Shugenja", "Artysta", "Dworzanin", "Mnich"]
    expect(build(:school, school_class: proper_school_class.sample)).to be_valid
  end	

  it "is invalid with blank clan " do	
    expect(build(:school, clan: nil)).to_not be_valid
  end
  
  it "is invalid with inproper clan" do
    expect(build(:school, clan: "Borsuk")).to_not be_valid
  end

  it "is valid with proper clan" do
    proper_clan = ["Feniks", "Krab" ,"Smok" ,"Jednorozec" ,"Lew" ,"Modliszka" ,"Pajak" ,"Rody_Cesarskie" ,"Pomniejsze" ,"Zuraw" ,"Skorpion"]
  	expect(build(:school, clan: proper_clan.sample )).to be_valid
  end
  
  it "is invalid with blank clan_name" do
    expect(build(:school, clan_name: nil)).to_not be_valid
  end
  context "school_class primary, 5 rangs school" do
    
    it "is has valid factory" do
      expect(build(:school_class_primary)).to be_valid
    end
    
    it "is invalid with rank1_name blank" do
      expect(build(:school_class_primary, rank1_name: nil)).to_not be_valid
    end

    it "is invalid with rank1_desc blank" do
      expect(build(:school_class_primary, rank1_desc: nil)).to_not be_valid
    end    

    it "is invalid with rank2_name blank" do
      expect(build(:school_class_primary, rank2_name: nil)).to_not be_valid
    end

    it "is invalid with rank2_desc blank" do
      expect(build(:school_class_primary, rank2_desc: nil)).to_not be_valid
    end
    
    it "is invalid with rank3_name blank" do
      expect(build(:school_class_primary, rank3_name: nil)).to_not be_valid
    end  

    it "is invalid with rank3_desc blank" do
      expect(build(:school_class_primary, rank3_desc: nil)).to_not be_valid
    end    
    
    it "is invalid with rank4_name blank" do
      expect(build(:school_class_primary, rank4_name: nil)).to_not be_valid
    end 

    it "is invalid with rank4_desc blank" do
      expect(build(:school_class_primary, rank4_desc: nil)).to_not be_valid
    end
    
    it "is invalid with rank5_name blank" do
      expect(build(:school_class_primary, rank5_name: nil)).to_not be_valid
    end   

    it "is invalid with rank5_desc blank" do
      expect(build(:school_class_primary, rank5_desc: nil)).to_not be_valid
    end  
  end
  
  context "shugenja class school" do
    it "has valid factory" do
    	expect(build(:shugenja_class_school)).to be_valid
    end
    
    it "is not valid with affinity_deficiency blank" do
      expect(build(:shugenja_class_school, affinity_deficiency: nil)).to_not be_valid
    end
    
    it "is not valid with spells blank" do
      expect(build(:shugenja_class_school, spells: nil)).to_not be_valid
    end   
    
    it "is not valid with spells blank" do
      expect(build(:shugenja_class_school, spells: nil)).to_not be_valid
    end 

    it "is not valid with shugenja_tech_name blank" do
      expect(build(:shugenja_class_school, shugenja_tech_name: nil)).to_not be_valid
    end

    it "is not valid with shugenja_tech_desc blank" do
      expect(build(:shugenja_class_school, shugenja_tech_desc: nil)).to_not be_valid
    end 
  end
  
  context "primary monk school" do
   
    it "is has valid factory" do
      expect(build(:primary_monk_school)).to be_valid
    end
  
    it "is invalid with rank1_name blank" do
      expect(build(:primary_monk_school, rank1_name: nil)).to_not be_valid
    end
    
     it "is invalid with rank1_desc blank" do
      expect(build(:primary_monk_school, rank1_desc: nil)).to_not be_valid
    end    

    it "is invalid with rank2_name blank" do
      expect(build(:primary_monk_school, rank2_name: nil)).to_not be_valid
    end

    it "is invalid with rank2_desc blank" do
      expect(build(:primary_monk_school, rank2_desc: nil)).to_not be_valid
    end
    
    it "is invalid with rank3_name blank" do
      expect(build(:primary_monk_school, rank3_name: nil)).to_not be_valid
    end  

    it "is invalid with rank3_desc blank" do
      expect(build(:primary_monk_school, rank3_desc: nil)).to_not be_valid
    end    
    
    it "is invalid with rank4_name blank" do
      expect(build(:primary_monk_school, rank4_name: nil)).to_not be_valid
    end 

    it "is invalid with rank4_desc blank" do
      expect(build(:primary_monk_school, rank4_desc: nil)).to_not be_valid
    end
    
    it "is invalid with rank5_name blank" do
      expect(build(:primary_monk_school, rank5_name: nil)).to_not be_valid
    end   

    it "is invalid with rank5_desc blank" do
      expect(build(:primary_monk_school, rank5_desc: nil)).to_not be_valid
    end              
  end
  
  context "order_of_shinsei_monk" do
    it "has valid factory" do
      expect(build(:order_of_shinsei_monk)).to be_valid
    end
    
    it "is invalid with monk_tech_name blank" do
      expect(build(:order_of_shinsei_monk, monk_tech_name: nil)).to_not be_valid
    end
    
    it "is invalid with monk_tech_desc blank" do
      expect(build(:order_of_shinsei_monk, monk_tech_desc: nil)).to_not be_valid
    end
  end
  
  it "should return proper objects with find_schools method" do
    smok_bushi = create(:school_class_primary, clan: "Smok", school_class: "Bushi")
    skorpion_bushi = create(:school_class_primary, clan: "Skorpion", school_class: "Bushi")
    smok_shugenja = create(:shugenja_class_school, clan: "Smok", school_class: "Shugenja")
    smok_bushi_2 = create(:school_class_primary, clan: "Smok", school_class: "Bushi")
    
    expect(School.find_schools("Smok","Bushi")).to eq([smok_bushi, smok_bushi_2])
  end
end
