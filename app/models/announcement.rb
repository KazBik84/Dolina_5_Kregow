class Announcement < ActiveRecord::Base
  #dependent: :destroy niszczy komentarze przypisane do annoucement-u
  has_many :comments, dependent: :destroy 
  #dafault scope pozwala określić między innymi kolejność (order) 
  #  w jakies będą wyszukiwane obiekty w bd
  default_scope-> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 255 } 
  validates :message, presence: true

  self.per_page = 10
end
