require 'rails_helper'

feature "User creates a new character" do
  let! (:phoeniks) { create :clan, name: "Feniks", clan_name: "Feniks" }
  let! (:unicorn)  { create :clan, name: "Jednorozec", clan_name: "Jednorożec" }
  let! (:shiba)    { create :family, name: "Shiba", clan_name: "Feniks", clan_id: phoeniks.id }
  let! (:utaku)    { create :family, name: "Utaku", clan_name: "Jednorozec", clan_id: unicorn.id }
  scenario "User visits create character form", js: true do
    visit root_path
    expect(page).to_not have_content "Twój Dział"
    sign_in
    expect(page).to have_content "Twój Dział"
    click_link "Twój Dział"
    click_link "Dodaj Postać"
    expect(page).to have_css 'article.Feniks'
  end

  scenario "User creates valid character", js: true do
    sign_in
    click_link "Twój Dział"
    click_link "Dodaj Postać"    
    create_character("Min - He", "Super strong samurai")
    expect(page).to have_link "Utaku Min - He"
  end

  scenario "User creates character with blank name" do
    sign_in
    click_link "Twój Dział"
    click_link "Dodaj Postać"    
    create_character("", "Super strong samurai")
    expect(page).to have_content "Proszę podać imię postaci" 
     
  end

end