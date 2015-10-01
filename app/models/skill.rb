class Skill < ActiveRecord::Base

  private

    def self.find_skills(sphare)
      if sphare.blank?
        Skill.all
      else
        Skill.where('sphare && ARRAY[?]', sphare)
      end
    end
end
