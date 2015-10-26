require "rails_helper"

RSpec.feature "Static pages", :type => :feature do
  scenario "Visiting the home page" do
    visit "/"
    expect(page).to have_title "Dolina Pięciu Kręgów"
  end
  scenario "Visiting the contact page", :type => :feature do
  	visit "/contact" 
  	expect(page).to have_title "Dolina Pięciu Kręgów | Kontakt"
  end
end
