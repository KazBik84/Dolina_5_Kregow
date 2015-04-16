class Announcement < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 255 } 
	validates :message, presence: true
	
	self.per_page = 10
end
