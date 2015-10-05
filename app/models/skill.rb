class Skill < ActiveRecord::Base

  validates :name, :name_pl, :attr, :desc, :sphare, presence: true
  # %w zwraca array obiektów w nawiasach
  validates_inclusion_of :sphare, in: [ ["Godna"], ["Niegodna"], ["Bugei"], ["Kupiecka"] ]


  private

    def self.find_skills(sphare)
      if sphare.blank?
        Skill.all
      else
        Skill.where('sphare && ARRAY[?]', sphare)
      end
    end
end
