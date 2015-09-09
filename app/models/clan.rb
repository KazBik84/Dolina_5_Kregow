class Clan < ActiveRecord::Base

  validates :name, :desc, presence: true
  validates_inclusion_of :name, :in=> [ "Feniks", "Krab", "Smok", "Jednorożec", "Lew", "Modliszka", "Pająk", "Rody Cesarskie", "Pomniejsze", "Zuraw", "Skorpion" ]

  def self.find_clan(clan)
    Clan.where(name: clan).first
  end
end
