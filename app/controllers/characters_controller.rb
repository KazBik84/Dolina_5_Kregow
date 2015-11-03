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
    @user = User.find(params[:user_id])
    @character = @user.characters.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @character = @user.characters.find(params[:id])
    if @character.update_attributes(character_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @character = @user.characters.find(params[:id])
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to current_user
  end

private
  
  def character_params
    params.require(:character).permit(:name, :clan, :desc, :family)
  end
end
