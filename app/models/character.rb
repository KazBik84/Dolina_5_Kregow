class Character < ActiveRecord::Base
  belongs_to :user

  validates :name, :clan, :desc, presence: true
  validates_inclusion_of :clan, in: %w( Krab Feniks Smok Jednorożec Lew Modliszka Pająk Skorpion Żuraw Rody_Cesarskie Pomniejsze )
end
