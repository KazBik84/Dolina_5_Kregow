class UsersController < ApplicationController
before_filter :authenticate_user!
before_filter :is_admin?, only: :index
before_filter :right_user?, only: :show
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  

private  
    def right_user?
      if  current_user.id == params[:id].to_i
        true
      else
        flash[:alert] = "Nie masz dostępu do tej sekcji"
        redirect_to root_path
      end
    end
end
