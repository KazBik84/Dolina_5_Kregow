require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it "has a valid factory" do
  	expect(build(:announcement)).to be_valid
  end
  it "is not valid without title" do
  	expect(build(:announcement, title: nil)).to_not be_valid
  end 
  it "is not valid without message" do
  	expect(build(:announcement, message: nil)).to_not be_valid
  end
  it "is not valid with title over 255 char" do
  	expect(build(:announcement, title: "a"*256)).to_not be_valid
  end
  
  it "should have many comments" do
  	should have_many(:comments)
  end
end
