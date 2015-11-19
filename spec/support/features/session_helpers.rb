module Features
  module SessionHelpers
    def sign_up_with(username, email, password)
      visit new_user_registration_path
      fill_in 'Username', with: username
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'Password confirmation', with: password
      click_button('Sign up')
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    def sign_in
      user = create(:user)
      visit new_user_session_path  
      fill_in 'Username lub Mail', with: user.username
      fill_in 'Hasło', with: user.password
      click_button 'Log in'
    end

    def logout
      click_on 'Logout'
    end

    def create_comment(text)
      fill_in 'comment_content', with: text
      click_button ('Dodaj!')
    end

    def create_character(name, desc)
      expect(page).to have_css('article.Feniks')
      select 'Jednorożec', from: 'character_clan'
      expect(page).to have_css('article.Jednorozec')
      select 'Utaku', from: 'character_family'
      fill_in "Imię", with: name
      fill_in "Opis Postaci",with: desc
      click_button "Zapisz"
    end
  end
end


