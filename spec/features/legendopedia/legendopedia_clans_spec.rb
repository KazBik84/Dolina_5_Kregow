require 'rails_helper'

feature "Tests for the clan and show_can views" do
  let! (:crane)   { create :clan, name: "Zuraw", clan_name: "Żuraw", desc: "Opis klanu Żurawia"}
  let! (:dragon)  { create :clan, name: "Smok", clan_name: "Smok", desc: "Opis klanu Smoka"}
  let! (:kakita)  { create :family, name: "Kakita", clan_name: "Zuraw", desc: "Opis rodu Kakita", clan_id: crane.id}
  let! (:kitsuki) { create :family, name: "Kitsuki", clan_name: "Smok", desc: "Opis rodu Kitsuki", clan_id: dragon.id}

  background do 
    visit clans_path
  end

  scenario "It should have proper breadcrumbs" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Klany"
  end

  scenario "Page should have proper title" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Klany"
  end

  scenario "In nav Legendopedia should be active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end

  scenario "Select Żuraw from the select menu" do
    select("Żuraw", from: 'clan_clan_name')
    click_button("Szukaj!")
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Klany › Wybrany klan"  
    expect(page).to have_title "Dolina Pięciu Kręgów | Klany"    
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")    
    expect(page).to have_content crane.clan_name
    expect(page).to have_content crane.desc
    expect(page).to have_content kakita.name
    expect(page).to have_content kakita.desc    
    expect(page).to_not have_content dragon.clan_name  
    expect(page).to_not have_content dragon.desc     
    expect(page).to_not have_content kitsuki.name  
    expect(page).to_not have_content kitsuki.desc    
  end
end