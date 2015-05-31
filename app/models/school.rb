class School < ActiveRecord::Base
	validates :name, :school_desc, :bonus, :skills, :honor, :outfit, :school_class, :clan, :clan_name, presence: true
validates_inclusion_of :clan , :in=> %w( Feniks Krab Smok Jednorożec Lew Modliszka Pająk Cesarskie Pomniejsze Zuraw Skorpion)
	if :school_class == "Bushi" || :school_class == "Dworzanin" || :school_class == "Artysta"
		validates :rank1_name, :rank1_desc, :rank2_name, :rank2_desc, :rank3_name, :rank3_desc,
							:rank4_name, :rank4_desc, :rank5_name, :rank5_desc, presence: true
	elsif :school_class == "Shugenja"
		validates :affinity_deficiency, :spells, :shugenja_tech_name, :shugenja_tech_desc, presence: true
	elsif :school_class == "Mnich"
		if monk_tech_name.present?
			validates :monk_tech_name, :monk_tech_desc, presence: true
		else
		  validates :rank1_name, :rank1_desc, :rank2_name, :rank2_desc, :rank3_name, :rank3_desc,
							:rank4_name, :rank4_desc, :rank5_name, :rank5_desc, presence: true
		end
	end
end
