require 'rails_helper'

feature "spells view and show spells view" do
  
  let! (:fire) { create :spell, name: "Pocałunek Ognia", krag: "1", zywiol: "Ogień", tagi: ["Grom"] }
  let! (:fire2) { create :spell, name: "Zazdrosny ogień", krag: "4", zywiol: "Ogień", tagi: [""] }
  let! (:water){ create :spell, name: "Gniew Oceanu", krag: "2", zywiol: "Woda", tagi: [""] }
  let! (:air)  { create :spell, name: "Iluzja szczęścia", krag: "3", zywiol: "Powietrze", tagi: ["Iluzja"] }
  let! (:earth){ create :spell, name: "Jadeitowy atak", krag: "4", zywiol: "Ziemia", tagi: ["Grom", "Rzemiosło"] }
  let! (:void) { create :spell, name: "Wszystko i nic", krag: "5", zywiol: "Pustka", tagi: [""] }
  let! (:maho) { create :spell, name: "Krew za krew", krag: "6", zywiol: "Maho", tagi: [""] }

  before do
    visit spells_path
  end

  scenario "It should have proper breadcrumbs" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Czary"
  end

  scenario "Page should have proper title" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Czary"
  end

  scenario "In nav Legendopedia should be active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end

  context "simple spell search form" do

    scenario "It should have simple spell_form visible" do
      expect(page).to have_css('div.simple_spell_form', visible: true)
    end

    scenario "It should have advance spell form not visible" do
      expect(page).to have_css('div.advance_spell_form', visible: false)
    end

    scenario "Search simple form with blank selects" do
      page.find('div.simple_spell_form').click_button("Szukaj!")
      expect(page).to have_title "Dolina Pięciu Kręgów | Czary"
      expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Czary › Wybrane czary"      
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia") 
      random_element = SPELL_ELEMENTS_PL.sample
      random_ring = SPELL_KRAG_ARRAY.sample[1]   
      expect(page).to have_content "Żywioł: #{random_element}"
      expect(page).to have_content "Krąg: #{random_ring}" 
    end

    scenario "Select Ogień form zywiol select, and no krag" do
      select('Ogień', from: 'spells_elements')
      page.find('div.simple_spell_form').click_button("Szukaj!")
      expect(page).to have_content fire.name
      expect(page).to_not have_content water.name      
    end

    scenario "Select krag Trzeci from krag, and blank zywiol" do
      select('Trzeci', from: 'spells_krag')     
      page.find('div.simple_spell_form').click_button("Szukaj!")
      expect(page).to have_content air.name
      expect(page).to_not have_content maho.name         
    end

    scenario "Select 'Ogień' from zywiol, and krag 'Czwarty'" do
      select('Ogień', from: 'spells_elements')      
      select('Czwarty', from: 'spells_krag')     
      page.find('div.simple_spell_form').click_button("Szukaj!")  
      expect(page).to have_content fire2.name
      expect(page).to_not have_content fire.name       
    end
  end

  context "Advance spell form test" do

    background do
      page.find('div.advance_spell_button', text: 'Zaawansowane przeszukiwani')
    end

    scenario "It should have simple spell_form not visible" do
      expect(page).to have_css('div.simple_spell_form', visible: false)
    end

    scenario "It should have advance spell form visible" do
      expect(page).to have_css('div.advance_spell_form', visible: true)
    end

    scenario "Select none checkboxes from form" do 
      page.find('div.advance_spell_form').click_button("Szukaj!")
      expect(page).to have_title "Dolina Pięciu Kręgów | Czary"
      expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Czary › Wybrane czary"      
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia") 
      random_element = SPELL_ELEMENTS_PL.sample
      random_ring = SPELL_KRAG_ARRAY.sample[1]   
      expect(page).to have_content "Żywioł: #{random_element}"
      expect(page).to have_content "Krąg: #{random_ring}" 
    end

    scenario "Select 'Ogień' and 'Woda' zywiol checkboxes, nut no krag checkboxes, and no tagi" do
      check('spells_elements_ogie')
      check('spells_elements_woda')
      page.find('div.advance_spell_form').click_button("Szukaj!")
      expect(page).to have_content fire.name
      expect(page).to have_content water.name      
      expect(page).to_not have_content earth.name             
      expect(page).to_not have_content maho.name      
    end

    scenario "Select 'Trzeci' and 'Piąty' krag checkboxes, and none zywiol checkboxes, and no tagi" do
      check('spells_krag_5')
      check('spells_krag_3')
      page.find('div.advance_spell_form').click_button("Szukaj!")  
      expect(page).to have_content air.name
      expect(page).to have_content void.name      
      expect(page).to_not have_content earth.name             
      expect(page).to_not have_content maho.name     
    end

    scenario "Select tagi 'Grom' " do
      check('spells_tag_grom')
      page.find('div.advance_spell_form').click_button("Szukaj!")  
      expect(page).to have_content fire.name
      expect(page).to have_content earth.name      
      expect(page).to_not have_content air.name             
      expect(page).to_not have_content maho.name               
    end 

    scenario "Select zywiol 'Ogień', krag 'Pierwszy', and tagi: 'Grom' " do
      check('spells_elements_ogie') 
      check('spells_tag_grom')
      check('spells_krag_1') 
      page.find('div.advance_spell_form').click_button("Szukaj!")  
      expect(page).to have_content fire.name    
    end
  end
end