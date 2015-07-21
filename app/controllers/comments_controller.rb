class CommentsController < ApplicationController
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.new(comments_params)
    if @comment.save
      flash[:success] = "Komentarz dodano"
      #Parametr przekazany z hiddenfielda :)
      redirect_to params[:comment][:redirect_to]
    else
      redirect_to root_path
    end
  end

  def destroy
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
  
  private
    def comments_params
      params.require(:comment).permit(:author,:content, :user_id)
    end
end
