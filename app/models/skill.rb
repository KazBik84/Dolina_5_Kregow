class Skill < ActiveRecord::Base

  validates :name, :name_pl, :attr, :desc, :sphare, presence: true
  validate :correct_sphare_types

private

  def correct_sphare_types
    if self.sphare.blank?
      errors.add(:sphare, "sphare is blank/invalid")
    # self to sprawdzany obiekt, detect sprawdza każdą wartość podanego atrybutu (array)
    #   i zwraca pierwszy element ktory jest prawda, w tym przypadku (! nie nalezy do podanego zbioru),
    #   wtedy wykonuj linijke z kodem bledu.
    elsif self.sphare.detect { |s| !(%w(Godna Niegodna Bugei Kupiecka).include? s) }
      errors.add(:sphare, "sphare is invalid")
    end
  end

  def self.find_skills(sphare)
    if sphare.blank?
      Skill.all
    else
      Skill.where('sphare && ARRAY[?]', sphare)
    end
  end
end
