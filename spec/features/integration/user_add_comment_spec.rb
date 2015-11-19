require 'rails_helper'

feature "User adda a comment to the announcement", js: true do
  let! (:announcement) { create :announcement}
  scenario "user create a comment with valid form" do
    visit root_path
    expect(page).to_not have_css 'div.create_comment'
    expect(page).to_not have_css 'div.create_comment_button'
    sign_in
    expect(page).to have_css 'div.create_comment_button'
    expect(page).to have_css('div.create_comment', visible: false)
    page.find('div.create_comment_button', text: "Dodaj Komentarz").click
    expect(page).to have_css('div.create_comment', visible: true)
    create_comment("Valid text")
    expect(page).to have_content 'Komentarze: 1'
  end

  scenario "user create comment with blank content", js: true do
    sign_in
    expect(page).to have_css 'div.create_comment_button'
    expect(page).to have_css('div.create_comment', visible: false)
    page.find('div.create_comment_button', text: "Dodaj Komentarz").click
    expect(page).to have_css('div.create_comment', visible: true)
    create_comment("")
    expect(page).to have_content 'Komentarze: 0'    
  end

  scenario "user create comment with to long content", js: true do
    sign_in
    expect(page).to have_css 'div.create_comment_button'
    expect(page).to have_css('div.create_comment', visible: false)
    page.find('div.create_comment_button', text: "Dodaj Komentarz").click
    expect(page).to have_css('div.create_comment', visible: true)
    create_comment("a"*300)
    expect(page).to have_content 'Komentarze: 0'    
  end
end