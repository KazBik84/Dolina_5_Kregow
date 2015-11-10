require 'rails_helper'

feature "Legendopedia main page" do
  background do
    visit legendopedia_path
  end

  scenario " it should have proper breadcumb" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia"
  end

  scenario "it should have proper title" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Legendopedia"
  end

  scenario "it should have 'Legendopedia' selected in the navigation" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: '/legendopedia')
  end

  scenario "it redirect to the chosen site in topic_id select_tag", js: true do
    select_options = ['Szkoły','Czary', 'Zalety i Wady', 'Klany', 'Umiejętności']
    random_select = select_options.sample
    select( random_select, from: 'topic_id')
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › #{random_select}"
  end
end