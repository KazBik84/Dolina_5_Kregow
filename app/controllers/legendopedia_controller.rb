class LegendopediaController < ApplicationController

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
end
