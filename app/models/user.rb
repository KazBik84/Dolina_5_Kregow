class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
           
  has_many :comments, dependent: :destroy
  has_many :characters, dependent: :destroy
  scope :id_order, -> { order(id: :asc) }

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
    end  
end
