class CommentsController < ApplicationController
  def create
	  @announcement = Announcement.find(params[:announcement_id])
  	@comment = @announcement.comments.new(comments_params)
  	if @comment.save
  		flash[:success] = "Komentarz dodano"
  		redirect_to root_path
  	else
  		render 'static_pages/home'
  	end
  end

  def destroy
  	@comment = Comment.find(:id)
  	redirect_to root_path
  end
  
  private
		def comments_params
			params.require(:comment).permit(:author,:content)
		end
end
