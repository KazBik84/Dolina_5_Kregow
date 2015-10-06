class CharactersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @character = Character.new
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
