class Comment < ActiveRecord::Base
  belongs_to :announcement
 	validates :author, presence: true, length: { maximum: 100 } 
	validates :content, presence: true, length: { maximum: 255 }  
end
