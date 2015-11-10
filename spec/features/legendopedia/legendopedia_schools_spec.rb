require 'rails_helper'

feature "legendopedia school page and legendopedia show schools" do

  let! (:scorpion) { create :school, name: "Szkoła Ninja Shoshuro", clan: "Skorpion", clan_name: "Skorpoion", school_class: "Ninja" }
  let! (:scorpion2){ create :school, name: "Szkoła Bushi Bayushi", clan: "Skorpion", clan_name: "Skorpoion", school_class: "Bushi" }
  let! (:dragon)   { create :school, name: "Szkoła Mnichów Togashi", school_class: "Mnich"}
  let! (:crane)    { create :school, name: "Szkoła Artystów Kakita", clan: "Zuraw", clan_name: "Żuraw", school_class: "Artysta"}
  let! (:crab)     { create :school, name: "Szkoła Bushi Hida", clan: "Krab", clan_name: "Krab", school_class: "Bushi"}
  let! (:unicorn)  { create :school, name: "Szkoła Bushi Shinjo", clan: "Jednorozec", clan_name: "Jednorożec", school_class: "Bushi"}
  let! (:phoenix)  { create :school, name: "Szkoła Shugenja Isawa", clan: "Feniks", clan_name: "Feniks", school_class: "Shugenja"}
  let! (:spider)   { create :school, name: "Szkoła Dworzan Susumu", clan: "Pajak", clan_name: "Pajak", school_class: "Dworzanin"}
  let! (:lion)     { create :school, name: "Szkoła  bushi Akodo", clan: "Lew", clan_name: "Lew", school_class: "Bushi"}
  let! (:mantis)   { create :school, name: "Szkoła Dworzan Yoritomo", clan: "Modliszka", clan_name: "Modliszka", school_class: "Dworzanin"}
  let! (:imperial) { create :school, name: "Szkoła Shugenja Otomo", clan: "Rody_Cesarskie", clan_name: "Rody Cesarskie", school_class: "Shugenja"}
  let! (:minor)    { create :school, name: "Szkoła Bushi Usagi", clan: "Pomniejsze", clan_name: "Zając", school_class: "Bushi"}
  let! (:ronin)    { create :school, name: "Szkoła Roninów", clan: "Ronin", school_class: "Bushi"}  

  background do
    visit schools_path
  end

  scenario "it should have right topic" do
    expect(page).to have_title "Dolina Pięciu Kręgów | Szkoły"
  end

  scenario "it should have proper breadcumb" do
    expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Szkoły"
  end

  scenario "it should have proper active" do
    expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
  end
  
  context " simple_school_form test" do

    scenario "simple school_form should be visible" do 
      expect(page).to have_css('div.simple_school_form', visible: true)
    end

    scenario "advance_school_form should be not visible on default" do
      expect(page).to have_css('div.advance_school_form', visible: false)
    end

    scenario "submiting the empty form" do
      page.find('div.simple_school_form').click_button('Szukaj!')
      expect(page).to have_title "Dolina Pięciu Kręgów | Szkoły"
      expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Szkoły › Wybrane szkoły"      
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
      random_clan = CLAN_NAMES.sample
      random_class = SCHOOL_CLASSES.sample
      expect(page).to have_content "Klasa Szkoły: #{random_class}"
      expect(page).to have_css("div.#{random_clan}")       
    end

    scenario "selecting just the clans form" do
      page.find('div.simple_school_form').select('Żuraw', from: 'schools_clans')
      page.find('div.simple_school_form').click_button('Szukaj!')
      expect(page).to have_content crane.name
      expect(page).to_not have_content mantis.name        
    end

    scenario "selecting just the school class" do
      page.find('div.simple_school_form').select('Ninja', from: 'schools_school_classes')
      page.find('div.simple_school_form').click_button('Szukaj!')
      expect(page).to have_content scorpion.name
      expect(page).to_not have_content minor.name       
    end

    scenario "selecting just the school class" do
      page.find('div.simple_school_form').select('Ninja', from: 'schools_school_classes')
      page.find('div.simple_school_form').select('Skorpion', from: 'schools_clans')      
      page.find('div.simple_school_form').click_button('Szukaj!')
      expect(page).to have_content scorpion.name
      expect(page).to_not have_content scorpion2.name       
    end   
  end

  context "Advance form tests" do

    background do
      page.find('div.advance_school_button', text: 'Zaawansowane przeszukiwanie').click
    end

    scenario "simple_school_form should be not visible" do
      expect(page).to have_css('div.simple_school_form', visible: false)
    end

    scenario "advance_school_form should be visible" do
      expect(page).to have_css('div.advance_school_form', visible: true)
    end

    scenario "selecting none check boxes" do
      page.find('div.advance_school_form').click_button('Szukaj!')
      expect(page).to have_title "Dolina Pięciu Kręgów | Szkoły"
      expect(page).to have_content "Jesteś tutaj: Strona Główna › Legendopedia › Szkoły › Wybrane szkoły"      
      expect(page.find('div.container li.active')).to have_selector(:link, '', href: "/legendopedia")
      random_clan = CLAN_NAMES.sample
      random_class = SCHOOL_CLASSES.sample
      expect(page).to have_content "Klasa Szkoły: #{random_class}"
      expect(page).to have_css("div.#{random_clan}")         
    end

    scenario "selecting smok and zuraw checkboxes and none classes" do
      check('schools_clans_smok')
      check('schools_clans_zuraw')
      page.find('div.advance_school_form').click_button('Szukaj!')
      expect(page).to have_content dragon.name
      expect(page).to have_content crane.name
      expect(page).to_not have_content lion.name  
      expect(page).to_not have_content phoenix.name        
    end

    scenario "selecting bushi and Shugenja from checkboxes and none clans" do
      check('schools_school_classes_shugenja')
      check('schools_school_classes_bushi')
      page.find('div.advance_school_form').click_button('Szukaj!')
      expect(page).to have_content crab.name
      expect(page).to have_content phoenix.name
      expect(page).to_not have_content spider.name  
      expect(page).to_not have_content crane.name                    
    end

    scenario "selecting bushi and Skorpion from checkboxes " do
      check('schools_clans_skorpion')
      check('schools_school_classes_bushi')
      page.find('div.advance_school_form').click_button('Szukaj!')
      expect(page).to have_content scorpion2.name
      expect(page).to_not have_content scorpion.name                    
    end    
  end
end