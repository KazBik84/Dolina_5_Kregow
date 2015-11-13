require 'rails_helper'

feature "Test creating new user step by step" do

  scenario "user sign up with valid form" do
    sign_up_with('Ali','Ali@wp.pl','qwer1234')
  end
end