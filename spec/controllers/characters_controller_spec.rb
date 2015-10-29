require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

  describe "GET #new" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user      
      get :new, user_id: @user.id
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "redirect to log in page" do
      expect(response).to render_template 'new'
    end
  end

  describe "GET #show" do

    let(:dummy_character) do
      FactoryGirl.create(:character, user_id: '2')
    end

    before(:each) do
      @user = FactoryGirl.create(:user, id: '2')
      sign_in @user          
      get :show, user_id: @user.id, id: dummy_character.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
      
    it "redirect to log in page" do
      expect(response).to render_template(:show)
    end
  end

end
