class LegendopediaController < ApplicationController
before_filter :authenticate_user!
  def main
  end
  
  def schools
  end
  
  def show_schools
    params[:clans].present? && params[:clans][0].present? ? @clans = params[:clans] : @clans = nil
    params[:school_classes].present? && params[:school_classes][0].present? ? @school_classes = params[:school_classes] : @school_classes= nil
    #Funkcja find_schools jest zdefiniowana w modelu school
    @chosen_schools = School.find_schools(@clans,@school_classes)
  end
  
  def spells
  end
  
  def show_spells
    params[:elements].present? && params[:elements][0].present? ? @elements = params[:elements] : @elements = nil
    params[:krag].present? && params[:krag][0].present? ? @kregi = params[:krag] : @kragi = nil
    @tags = params[:tag]
    @chosen_spells = Spell.find_spells(@elements, @kregi, @tags).to_a    
  end

  def traits
  end
  
  def show_traits
    params[:kind].present? && params[:kind][0].present? ? @kind = params[:kind] : @kind = nil
    params[:types].present? && params[:types][0].present? ? @types = params[:types] : @types = nil
    @from = params[:from]
    @to = params[:to]
    @values = nil
    unless @from.blank? || @to.blank?
      if @from < @to
        # Do zbioru zawsze dodawana jest wartość "Różna" bo niejest określona
        @values = (@from..@to).to_a  << "Różna"
      else
        @values = (@to..@from).to_a << "Różna"
      end
    end
    @chosen_traits = Trait.find_traits(@kind, @types, @values).to_a
  end

  def clans
  end

  def show_clan
    @clan = Clan.find_clan(params[:clan])
    @clan_families = Family.find_families(params[:clan]).to_a
    @clan_schools = School.find_clan_schools(params[:clan]).to_a
  end

  def skills
  end

  def show_skills
    @skills = Skill.find_skills(params[:sphare])
  end

  
end
