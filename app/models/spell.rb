class Spell < ActiveRecord::Base

  validates :nazwa, :krag, :zywiol, :obszar, :zasieg, :opis, :czas, presence: true
  validates_inclusion_of :zywiol, in: [ "Ogień", "Ziemia", "Powietrze", "Woda", "Pustka", "Maho" ]
  validates_inclusion_of :krag, in: %w( 1 2 3 4 5 6 )
  
  def self.find_spells(zywiol, krag, tagi)
    if tagi.blank?
      Spell.where(zywiol: zywiol, krag: krag ).to_a
    else
      Spell.where(zywiol: zywiol, krag: krag ).where('tagi @> ARRAY[?]', tagi).to_a
    end
  end
  
end
