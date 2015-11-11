require 'rails_helper'

feature "tests for skills and show skills views" do
 
  let! (:bugei) { create :skill, name: "Kenjutsu", sphare: ["Bugei"], desc: "Sztuka władania mieczem" }
  let! (:high)  { create :skill, name: "Dyplomacja", sphare: ["Godna"], desc: "Sztuka władania słowem"}
  let! (:mix)   { create :skill, name: "Wyrób mieczy", sphare: ["Godna", "Kupiecka"], desc: "Sztuka wytwarzania mieczy" }
  background do
    visit skills_path
  end

  scenario "It should have proper breadcrumbs" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Umiejętności"
  end

  scenario "Page should have proper title" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Umiejętności"
  end

  scenario "In nav Legendopedia should be active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end  

  scenario "Nothing is select from skills select menu" do
    click_button("Szukaj!")
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Umiejętności › Wybrane Umiejętności" 
    expect(page).to have_title "Dolina Pięciu Kręgów | Umiejętności"    
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
    expect(page).to have_content bugei.name
    expect(page).to have_content bugei.desc    
    expect(page).to have_content high.name
    expect(page).to have_content high.desc    
    expect(page).to have_content mix.name
    expect(page).to have_content mix.desc    
  end

  scenario "Select 'Godne' in the select menu" do
    select("Godne", from: 'skills_sphare')
    click_button("Szukaj!")
    expect(page).to have_content high.name
    expect(page).to have_content high.desc    
    expect(page).to have_content mix.name
    expect(page).to have_content mix.desc  
    expect(page).to_not have_content bugei.name
    expect(page).to_not have_content bugei.desc              
  end
end