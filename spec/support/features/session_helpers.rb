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
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    def logout
      click_on 'Logout'
    end
  end
end


