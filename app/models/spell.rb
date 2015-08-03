class Spell < ActiveRecord::Base

  def self.find_spells(zywiol, krag, tagi)
    if tagi.blank?
      Spell.where(zywiol: zywiol, krag: krag ).to_a
    else
      Spell.where(zywiol: zywiol, krag: krag ).where('tagi @> ARRAY[?]', tagi).to_a
    end
  end
  
end
