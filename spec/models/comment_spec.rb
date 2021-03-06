require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
  	expect(build(:comment)).to be_valid
  end
  
  it "belongs to announcement model" do
  	should belong_to(:announcement)
  end
  
  it "is not valid with blank author" do
  	expect(build(:comment, author: nil)).to_not be_valid
  end
  
  it "is not valid with author over 100 chars" do
  	expect(build(:comment, author: "a"*101)).to_not be_valid
  end
  
  it "is not valid with blank content" do
  	expect(build(:comment, content: nil)).to_not be_valid
  end
  
  it "is not valid with content over 255 chars" do
  	expect(build(:comment, content: "a"*256)).to_not be_valid
  end
end
