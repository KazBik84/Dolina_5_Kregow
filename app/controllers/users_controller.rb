class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?, only: :index
  before_filter :right_user?, only: :show
  
  def show
    @user = User.find(params[:id])
    @characters = @user.characters.all.order(:family, :name)
  end
  
  def index
    @users = User.all
  end
  


end
