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
  scenario "Visiting the about page", :type => :feature do
  	visit "/about"
  	expect(page).to have_title "Dolina Pięciu Kręgów | O projekcie"
  end
  scenario "Visiting the to do page", :type => :feature do
  	visit "/to_do"
  	expect(page).to have_title "Dolina Pięciu Kręgów | Do zrobienia"
  end
end
