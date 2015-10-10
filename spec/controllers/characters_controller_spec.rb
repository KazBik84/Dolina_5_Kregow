require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

  describe "GET #new" do
    context "user not logged in" do
      before(:each) do
        get :new
      end
      it "returns http success" do
        expect(response).to have_http_status(:redirect)
      end

      it "redirect to log in page" do
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #show" do
      before(:each) do
        get :show
      end
      it "returns http success" do
        expect(response).to have_http_status(:redirect)
      end
      

      it "redirect to log in page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
