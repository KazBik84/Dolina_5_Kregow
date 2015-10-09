class AnnouncementsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "Post został pomyślnie dodany"
      redirect_to root_path
    else
      # nie może być redirect ponieważ błędy zostaną utracone jako wynik nowego żądania
      #  dlatego musi być render by móc wykorzystać powstałe błędy. 
      render 'new'
    end
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      flash[:success] = "Post został zaktualizowany"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def destroy
    Announcement.find(params[:id]).destroy
    flash[:success] = "News został ZNISZCZONY!!!!"
    redirect_to root_path
  end

  def show
    @announcement = Announcement.find(params[:id])
    @user = current_user if user_signed_in?
  end
  
  private
  
    def announcement_params
      params.require(:announcement).permit(:title,:message)
    end
end
