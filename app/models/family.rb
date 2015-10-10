class Family < ActiveRecord::Base

  belongs_to :clan

  validates :desc, :name, :bonus, :clan_name, presence: true
  validates_inclusion_of :clan_name, :in=> [ "Feniks", "Krab", "Smok", "Jednorożec", "Lew", "Modliszka", "Pająk", "Rody_Cesarskie", "Pomniejsze", "Żuraw", "Skorpion" ]

  def self.find_families(name)
    Family.where(clan: name)
  end
end
