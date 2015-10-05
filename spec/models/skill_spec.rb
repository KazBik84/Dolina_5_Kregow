require 'rails_helper'

RSpec.describe Skill, type: :model do
  it "has a valid factory" do
    expect(build(:skill)).to be_valid
  end
  it "is not valid with blank name" do
    expect(build(:skill, name: nil)).to_not be_valid
  end
  it "is not valid with blank name_pl" do
    expect(build(:skill, name_pl: nil)).to_not be_valid
  end  
  it "is not valid with blank attr" do
    expect(build(:skill, attr: nil)).to_not be_valid
  end 
  it "is not valid with blank desc" do
    expect(build(:skill, desc: nil)).to_not be_valid
  end  
  it "is not valid with blank sphare" do
    expect(build(:skill, sphare: nil)).to_not be_valid
  end
  it "is not valid with wrong sphare" do
    expect(build(:skill, sphare: ["Alibaba"])).to_not be_valid
  end
 it "is valid with proper sphare" do
    proper_sphare = ["Godna", "Niegodna", "Kupiecka", "Bugei"]
    expect(build(:skill, sphare: [proper_sphare.sample])).to be_valid
  end  
end
