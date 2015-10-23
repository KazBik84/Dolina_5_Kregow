class Character < ActiveRecord::Base
  belongs_to :user

  validates :name, :clan, :desc, presence: true
  #CLAN_NAMES is located in: config/initializers/constants.rb  
  validates_inclusion_of :clan, in: CLAN_NAMES
end
