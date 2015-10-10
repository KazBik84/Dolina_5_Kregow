class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def is_admin?
    if current_user && current_user.admin == true
      true
    else
      flash[:alert] = "Nie posiadasz dostępu do tej sekcji"
      redirect_to root_path
    end
  end

  def right_user?

    #p "To jest current_user.id>> #{current_user.id}"
    #p "To jest params[:id] >> #{params[:id]}"
    #p "To jest params[:user_id] >> #{params[:user_id]}"
    #p "To jest params >> #{params}"
    if  current_user.id == params[:id].to_i || current_user.id == params[:user_id].to_i
      true
    else
      flash[:alert] = "Nie masz dostępu do tej sekcji"
      redirect_to root_path
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
