class CommentsController < ApplicationController
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.new(comments_params)
    url = params[:from_url]
    respond_to do |format|    
      if @comment.save
        flash[:success] = "Komentarz dodano"
        format.html { redirect_to root_path }
        format.js #render comments/create.js.erb
        
      else
        format.html { redirect_to url }
      end
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
