class CharactersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :right_user?
  
  def new
    @user = User.find(params[:user_id])
    @character = Character.new
    @clan = Clan.where(name: params[:clan]).take || Clan.where(name: "Feniks").take
    respond_to do |format|
      format.js      
      format.html 
 #render comments/create.js.erb            
    end
  end

  def create
    @user = User.find(params[:user_id])
    @character = @user.characters.new(character_params)

    if @character.save
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
  end

private
  
  def character_params
    params.require(:character).permit(:name, :clan, :desc)
  end
end
