require 'rails_helper'

RSpec.describe Trait, type: :model do
	it "has valid factory" do
		expect(build(:trait)).to be_valid
	end

  it "is not valid with nil kind" do
    expect(build(:trait, kind: nil)).to_not be_valid
  end

  it " is not valid with wrong kind" do
    expect(build(:trait, kind: "Aibaba")).to_not be_valid
  end

  it "is valid with right kind parameter" do
    expect(build(:trait)).to be_valid
  end

  it "is not valid with nil name" do
    expect(build(:trait, name: nil)).to_not be_valid
  end

  it "is not valid with nil name_pl" do
    expect(build(:trait, name_pl: nil)).to_not be_valid
  end

  it "is not valid with sphere nil" do
    expect(build(:trait, sphere: nil)).to_not be_valid
  end

  it "is not valid with wrong sphere" do
    expect(build(:trait, sphere: "Kamień")).to_not be_valid
  end

  it "is valid with correct sphere " do
    expect(build(:trait)).to be_valid
  end

  it "is not valid wiht empty array" do
    expect(build(:trait, value: [])).to_not be_valid
  end

end
