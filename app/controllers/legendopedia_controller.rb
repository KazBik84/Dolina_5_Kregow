class LegendopediaController < ApplicationController
before_filter :authenticate_user!
  def main
  end
  
  def schools
  end
  
  def show_schools
    @clans = params[:clans]
    @school_classes = params[:school_classes]
    #Funkcja find_schools jest zdefiniowana w modelu school
    @chosen_schools = School.find_schools(@clans,@school_classes)
  end
  
  def spells
  end
  
  def show_spells
    @elements = params[:elements]
    @kregi = params[:krag]
    @tags = params[:tag]
    @chosen_spells = Spell.find_spells(@elements, @kregi, @tags).to_a    
  end

  def traits
  end
  
  def show_traits
    @kind = params[:kind]
    @types = params[:types]
    @from = params[:from]
    @to = params[:to]
    @rozne = params[:rozne]
    if @from < @to
      @values = (@from..@to).to_a
    else
      @values = (@to..@from).to_a
    end
  end
  
end
