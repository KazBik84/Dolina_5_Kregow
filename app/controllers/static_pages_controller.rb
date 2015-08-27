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

  def osw
  end

  def osw_show

  	unless params[:password] == "Mirumoto"
  		redirect_to osw_path
    end
  		
  end
end
