require 'rails_helper'

RSpec.describe Character, type: :model do
  
  it "has valid factory" do
    expect(build(:character)).to be_valid
  end

  it "should belongs to user" do
    should belong_to :user
  end

  it "should be not valid with name blank" do
    expect(build(:character, name: nil)).to_not be_valid
  end

  it "should not be valid with desc blank" do
    expect(build(:character, desc: nil)).to_not be_valid
  end

  it "should not be valid with blank family" do
    expect(build(:character, family: nil)).to_not be_valid
  end

  it "should not be valid with blank clan" do
    expect(build(:character, clan: nil)).to_not be_valid
  end
end
