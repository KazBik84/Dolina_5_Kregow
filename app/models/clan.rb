class Clan < ActiveRecord::Base

  has_many :families, dependent: :destroy


  validates :name, :desc, presence: true
  #CLAN_NAMES is located in: config/initializers/constants.rb
  validates_inclusion_of :name, in: CLAN_NAMES

  def self.find_clan(clan)
    Clan.where(name: clan).first
  end
end
