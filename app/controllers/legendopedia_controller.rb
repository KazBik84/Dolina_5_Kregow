class LegendopediaController < ApplicationController

  def main
  end
  
  def schools
  end
  
  def show_schools
    @clans = params[:clans]
    @school_classes = params[:school_classes]
    @chosen_schools = School.where(clan: @clans, school_class: @school_classes).to_a 
  end
end
