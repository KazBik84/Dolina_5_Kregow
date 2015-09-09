require 'rails_helper'

RSpec.describe Clan, type: :model do
  it "has valid factories" do
    expect(build(:clan)).to be_valid
  end

  it "is not valid with name blank" do
    expect(build(:clan, name: nil )).to_not be_valid
  end

  it "is not vlid with wrong name" do
    expect(build(:clan, name: "Alibaba")).to_not be_valid
  end

  it "is not valid  with blank desc" do
    expect(build(:clan, desc: "")).to_not be_valid
  end
end
