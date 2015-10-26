class Spell < ActiveRecord::Base

  validates :name, :krag, :zywiol, :obszar, :zasieg, :opis, :czas, presence: true
  validates_inclusion_of :zywiol, in: [ "Ogień", "Ziemia", "Powietrze", "Woda", "Pustka", "Maho" ]
  validates_inclusion_of :krag, in: %w( 1 2 3 4 5 6 )
  
  def self.find_spells(zywiol, krag, tagi)
    if zywiol.nil? && krag.nil? && tagi.nil?
      Spell.all
    elsif zywiol.nil? && krag.nil? && tagi.present?
      Spell.all.where('tagi && ARRAY[?]', tagi)
    elsif zywiol.nil? && krag.present? && tagi.nil?
      Spell.where(krag: krag)
    elsif zywiol.present? && krag.nil? && tagi.nil?
      Spell.where(zywiol: zywiol)      
    elsif zywiol.nil? && krag.present? && tagi.present?
      Spell.where(krag: krag).where('tagi && ARRAY[?]', tagi)
    elsif zywiol.present? && krag.nil? && tagi.present?
      Spell.where(zywiol: zywiol).where('tagi && ARRAY[?]', tagi)
    elsif zywiol.present? && krag.present? && tagi.nil?
      Spell.where(zywiol: zywiol, krag: krag)
    elsif zywiol.present? && krag.present? && tagi.present?
      Spell.where(zywiol: zywiol, krag: krag).where('tagi && ARRAY[?]', tagi)
    end
  end
  
end
