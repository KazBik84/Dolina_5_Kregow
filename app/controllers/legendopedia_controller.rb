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
    @chosen_spells = Spell.find_spells(@elements, @kregi, @tags)    
  end
#  def show_spells
#    @elements = params[:elements]
#    @kregi = params[:krag]
#    @tags = params[:tag]
#    if params[:tag].blank?
#      @chosen_spells = Spell.where(zywiol: params[:elements], krag: params[:krag] ).to_a
#    else      
#      @chosen_spells = Spell.where( "zywiol = ? and krag = ? and tagi = ARRAY[?]", params[:elements], params[:krag], params[:tag]).to_a
#    end 
 # end
  
end
