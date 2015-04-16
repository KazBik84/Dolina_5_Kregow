class StaticPagesController < ApplicationController
  def home
  	@announcements = Announcement.page(params[:page]).order('id DESC')
  end

  def contact
  end

  def about
  end
  
  def to_do
  end
end
