class LegendopediaController < ApplicationController

  def main
  end
  
  def schools
  end
  
  def show_schools
    params[:schools][:clans].present? && params[:schools][:clans][0].present? ? @clans = params[:schools][:clans] : @clans = nil
    params[:schools][:school_classes].present? && params[:schools][:school_classes][0].present? ? @school_classes = params[:schools][:school_classes] : @school_classes= nil
    #Funkcja find_schools jest zdefiniowana w modelu school
    @chosen_schools = School.find_schools(@clans,@school_classes).order(:clan, :school_class, :name)
  end
  
  def spells
  end
  
  def show_spells
    params[:spells][:elements].present? && params[:spells][:elements][0].present? ? @elements = params[:spells][:elements] : @elements = nil
    params[:spells][:krag].present? && params[:spells][:krag][0].present? ? @kregi = params[:spells][:krag] : @kragi = nil
    @tags = params[:spells][:tag]
    @chosen_spells = Spell.find_spells(@elements, @kregi, @tags).order(:zywiol, 'krag ASC', :name)   
  end

  def traits
  end
  
  def show_traits
    params[:traits][:kind].present? && params[:traits][:kind][0].present? ? @kind = params[:traits][:kind] : @kind = nil
    params[:traits][:sphare].present? && params[:traits][:sphare][0].present? ? @sphare = params[:traits][:sphare] : @sphare = nil
    @from = params[:traits][:from]
    @to = params[:traits][:to]
    @values = nil
    unless @from.blank? || @to.blank?
      if @from < @to
        # Do zbioru zawsze dodawana jest wartość "Różna" bo nie jest określona
        @values = (@from..@to).to_a  << "Różna"
      else
        @values = (@to..@from).to_a << "Różna"
      end
    end
    @chosen_traits = Trait.find_traits(@kind, @sphare, @values).order(:kind, :name)
  end

  def clans
  end

  def show_clan
    @clan = Clan.find_clan(params[:clan][:clan_name])
    @clan_families = @clan.families
    @clan_schools = School.find_clan_schools(@clan.name).order(:name)
  end

  def skills
  end

  def show_skills
    @skills = Skill.find_skills(params[:skills][:sphare]).order(:sphare, :name)
  end

end
