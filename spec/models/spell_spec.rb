require 'rails_helper'

RSpec.describe Spell, type: :model do
  
  it "has valid Factory" do
    expect(build(:spell)).to be_valid
  end
  
  it "is invalid with blank nazwa" do
    expect(build(:spell, nazwa: nil)).to_not be_valid
  end
  
  it "is invalid with blank obszar" do
    expect(build(:spell, obszar: nil)).to_not be_valid
  end

  it "is invalid with blank zasieg" do
    expect(build(:spell, zasieg: nil)).to_not be_valid
  end  
 
  it "is invalid with blank opis" do
    expect(build(:spell, opis: nil)).to_not be_valid
  end
  
  it "is invalid with blank czas" do
    expect(build(:spell, czas: nil)).to_not be_valid
  end
  
  it "is invalid with blank krag" do
    expect(build(:spell, krag: nil)).to_not be_valid
  end  
  
  it "is invalid with blank zywiol" do
    expect(build(:spell, zywiol: nil)).to_not be_valid
  end  
  
  it "is invalid with zywiol not from array" do
    expect(build(:spell, zywiol: "Ziemniak")).to_not be_valid
  end  
  
  it "is invalid with krag not from array" do
    expect(build(:spell, krag: "33")).to_not be_valid
  end
end
