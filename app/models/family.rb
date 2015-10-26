class Family < ActiveRecord::Base

  belongs_to :clan

  validates :desc, :name, :bonus, :clan_name, presence: true
  #CLAN_NAMES is located in: config/initializers/constants.rb  
  validates_inclusion_of :clan_name, in: CLAN_NAMES

  def self.find_families(name)
    Family.where(clan: name)
  end
end
