require 'rails_helper'

feature "legendopedia school page" do
  background do
    visit schools_path
  end

  scenario "it should have right topic" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Szkoły"
  end

  scenario "it should have proper breadcumb" do
    puts page.body
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Szkoły"
  end

  scenario "it should have proper active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end
end