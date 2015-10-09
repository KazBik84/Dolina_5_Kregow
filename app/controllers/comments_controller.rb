class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :right_user?
  
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.new(comments_params)
    # url zwraca hash: { from_url: "jakis adres"}, temu trzeba dopisać 
    #  jakiego elementu chcemy wynik. 
    @url = url_permit[:from_url]
    respond_to do |format|    
      if @comment.save
        format.html { redirect_to @url }
        format.js #render comments/create.js.erb        
      else
        format.html { redirect_to @url }
      end
    end
  end

  def destroy
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.find(params[:id])
    @comment.destroy
    redirect_to params[:url]
  end
  
  private
    def comments_params
      params.require(:comment).permit(:author,:content, :user_id)
    end
    # Tu potrzebna jest dodatkowa funkcja gdyż parametr from_url nie zapisujemy w komentarzu 
    #  a jedynie dopuszczamy do kontrolera :)
    def url_permit
      params.require(:comment).permit(:from_url)
    end


end
