class School < ActiveRecord::Base
  validates :name, :school_desc, :bonus, :skills, :honor, :outfit, :school_class, :clan, :clan_name, presence: true
  #CLAN_NAMES is located in: config/initializers/constants.rb
  validates_inclusion_of :clan, in: CLAN_NAMES
  validates_inclusion_of :school_class, in: %w( Bushi Shugenja Dworzanin Mnich Artysta Ninja)
  validates :rank1_name, :rank1_desc, :rank2_name, :rank2_desc, :rank3_name, :rank3_desc,
  # po if: należy odwołać się do funkcji poprzez symbol tej funkcji
              :rank4_name, :rank4_desc, :rank5_name, :rank5_desc, presence: true, if: :primary_school?
  validates :affinity_deficiency, :spells, :shugenja_tech_name, :shugenja_tech_desc, presence: true, if: :shugenja_school?
  validates :rank1_name, :rank1_desc, :rank2_name, :rank2_desc, :rank3_name, :rank3_desc,
            :rank4_name, :rank4_desc, :rank5_name, :rank5_desc, presence: true, if: :primary_monk_school?
  validates :monk_tech_name, :monk_tech_desc, presence: true, if: :order_of_shinsei_monk?

  #Funkcja zwraca szukane szkoły zgodnie z podanymi parametrami
  def self.find_schools(clan,school_class)
    if clan.nil? && school_class.nil?
      School.all
    elsif clan.nil? && school_class.present?
      School.where(school_class: school_class)
    elsif clan.present? && school_class.nil?
      School.where(clan: clan)
    elsif clan.present? && school_class.present?
      School.where(clan: clan, school_class: school_class)
    end
  end

  def self.find_clan_schools(clan)
    School.where(clan: clan)
  end
  
private 
  # funkcja jest zakończona '?' gdyż zwraca wartość true/false
  def primary_school?
    #Wewnątrz funkcji do atrybutów zwracamy się jak do zmiennych... chuj wie dlaczego.
    school_class == "Bushi" || school_class == "Dworzanin" || school_class == "Artysta" 
  end
  
  def shugenja_school?
    school_class == "Shugenja"
  end
  
  def primary_monk_school?
    school_class == "Mnich" && monk_tech_desc.blank? && monk_tech_name.blank?
  end
  
  def order_of_shinsei_monk?
    school_class == "Mnich" && monk_tech_desc.present? || monk_tech_name.present?
  end
end
