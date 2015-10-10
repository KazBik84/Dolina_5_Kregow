require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Family, type: :model do
  it "has a valid factories" do
    expect(build(:family)).to be_valid
  end

  it "belongs to clan model" do
    should belong_to(:clan)
  end  

  it "is invalid with clan blank" do
    expect(build(:family, clan_name: nil)).to_not be_valid
  end

  it "is invalid with wrong clan" do
    expect(build(:family, clan_name: "Alibaba")).to_not be_valid
  end

  it "is invalis with blank bonus" do
    expect(build(:family, bonus: nil)).to_not be_valid
  end

  it "is invalid with name blank" do
    expect(build(:family, name: nil)).to_not be_valid
  end
end
