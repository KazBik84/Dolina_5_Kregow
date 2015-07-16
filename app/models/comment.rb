class Comment < ActiveRecord::Base
  belongs_to :announcement
  belongs_to :user
  validates :author, presence: true, length: { maximum: 100 } 
  validates :content, presence: true, length: { maximum: 255 }  

# Scope to ręcznie zdefiniowana funkcja która użyta zwraca obiekty 
#   wg okreslonego wzorca
  scope :reverse_order, -> { order(created_at: :desc)	}
end
