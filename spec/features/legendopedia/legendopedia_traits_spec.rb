require 'rails_helper'

feature "test for traits and show traits pages" do
  let! (:adv)    { create :trait, name: "Ręce z kamienia", sphere: "Fizyczna", value: ["1"] }
  let! (:adv2)   { create :trait, name: "Dusza artysty", sphere: "Umysłowa", value: ["2"] }
  let! (:adv3)   { create :trait, name: "Linoskoczek", sphere: "Fizyczna", value: ["2"] }
  let! (:disadv) { create :trait, name: "Nawiedzony", sphere: "Duchowa", kind: "Wada", value: ["3"] }
  let! (:disadv2){ create :trait, name: "Biedny", sphere: "Materialna", kind: "Wada", value: ["4"] }
  let! (:disadv3){ create :trait, name: "Aspołeczny", sphere: "Społeczna", kind: "Wada", value: ["1","2","3","4"] }  

  background do
    visit traits_path
  end

  scenario "It should have proper breadcrumbs" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Zalety i Wady"
  end

  scenario "Page should have proper title" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Zalety i Wady"
  end

  scenario "In nav Legendopedia should be active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end

  context "simple traits form test" do

    scenario "simple traits form shouls be visible" do
      expect(page).to have_css('div.simple_traits_form', visible: true)
    end

    scenario "advance traits for should not be visible" do
      expect(page).to have_css('div.advance_traits_form', visible: false)
    end

    scenario "It should return all traits if empty form is passed" do
      page.find('div.simple_traits_form').click_button("Szukaj!")
      expect(page).to have_content "Strona Główna › Legendopedia › Zalety i Wady › Wybrane zalety i wady"
      expect(page).to have_title "Dolina Pięciu Kręgów | Zalety i Wady"
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
      random_kind = TRAITS_KIND_SINGULAR.sample
      random_sphare = TRAITS_SPHARE_SINGULAR.sample 
      expect(page).to have_css("div.#{random_kind}")  
      expect(page).to have_content("Typ: #{random_sphare}")
      expect(page).to have_content adv.name
      expect(page).to have_content disadv.name         
    end

    scenario "select 'Zalety' from traits_kind, and no sphre" do
      select('Zalety', from: 'traits_kind')
      page.find('div.simple_traits_form').click_button("Szukaj!")
      expect(page).to have_content adv.name      
      expect(page).to have_content adv2.name  
      expect(page).to_not have_content disadv.name      
      expect(page).to_not have_content disadv2.name 
    end 

    scenario "select 'Fizyczna' from traits_sphare, and no kind" do
      select('Fizyczne', from: 'traits_sphare')
      page.find('div.simple_traits_form').click_button("Szukaj!")
      expect(page).to have_content adv.name      
      expect(page).to_not have_content adv2.name  
      expect(page).to_not have_content disadv.name      
      expect(page).to_not have_content disadv2.name 
    end 

    scenario "select 'Wady' from traits_kind, and 'Duchowe' from traits_sphare" do
      select('Duchowe', from: 'traits_sphare')  
      select('Wady', from: 'traits_kind')
      page.find('div.simple_traits_form').click_button("Szukaj!")    
      expect(page).to have_content disadv.name 
      expect(page).to_not have_content disadv2.name 
      expect(page).to_not have_content adv.name                       
    end
  end

  context "advance_traits_form" do

    background do
      page.find('div.advance_traits_button', text: 'Zaawansowane przeszukiwanie').click
    end

    scenario "simple traits form shouls be visible" do
      expect(page).to have_css('div.simple_traits_form', visible: false)
    end

    scenario "advance traits for should not be visible" do
      expect(page).to have_css('div.advance_traits_form', visible: true)
    end

    scenario "not selecting anything should return all objects, also test if the provide values works correct" do
      page.find('div.advance_traits_form').click_button("Szukaj!")  
      expect(page).to have_content "Strona Główna › Legendopedia › Zalety i Wady › Wybrane zalety i wady"
      expect(page).to have_title "Dolina Pięciu Kręgów | Zalety i Wady"
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")      
      random_kind = TRAITS_KIND_SINGULAR.sample
      random_sphare = TRAITS_SPHARE_SINGULAR.sample 
      expect(page).to have_css("div.#{random_kind}")  
      expect(page).to have_content("Typ: #{random_sphare}")
      expect(page).to have_content adv.name
      expect(page).to have_content disadv.name                   
    end

    scenario "select 'Zaleta' checkbox from the form, and leave empty rest" do
      check('traits_kind_zaleta')
      page.find('div.advance_traits_form').click_button("Szukaj!") 
      expect(page).to have_content adv.name      
      expect(page).to have_content adv2.name  
      expect(page).to_not have_content disadv.name      
      expect(page).to_not have_content disadv2.name 
    end

    scenario "select 'Duchowe' and 'Społeczne' checkboxes, and leave rest empty" do
      check('traits_sphare_spoeczna')
      check('traits_sphare_duchowa')  
      page.find('div.advance_traits_form').click_button("Szukaj!")   
      expect(page).to have_content disadv.name      
      expect(page).to have_content disadv3.name  
      expect(page).to_not have_content adv.name      
      expect(page).to_not have_content disadv2.name               
    end

    scenario "select value range from 1 to 2" do
      select('1', from: 'traits_from')
      select('2', from: 'traits_to')
      page.find('div.advance_traits_form').click_button("Szukaj!")   
      expect(page).to have_content adv.name      
      expect(page).to have_content adv2.name 
      expect(page).to have_content disadv3.name 
      expect(page).to_not have_content disadv.name      
      expect(page).to_not have_content disadv2.name              
    end

    scenario "select kind 'Zaleta', sphere 'Fizyczna' and value '1'" do
      check('traits_kind_zaleta')
      check('traits_sphare_fizyczna')
      select('1', from: 'traits_from')
      select('1', from: 'traits_to')
      page.find('div.advance_traits_form').click_button("Szukaj!")  
      expect(page).to have_content adv.name   
      expect(page).to_not have_content adv3.name             
    end
  end
end