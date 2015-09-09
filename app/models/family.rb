class Family < ActiveRecord::Base

  validates :desc, :name, :bonus, :clan, presence: true
  validates_inclusion_of :clan, :in=> [ "Feniks", "Krab", "Smok", "Jednorożec", "Lew", "Modliszka", "Pająk", "Rody Cesarskie", "Pomniejsze", "Zuraw", "Skorpion" ]

  def self.find_families(name)
    Family.where(clan: name)
  end
end
