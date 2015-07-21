class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.page(params[:page]).order('id DESC')
    @user = current_user if user_signed_in? 
  end

  def contact
  end

  def about
  end
  
  def to_do
  end
end
