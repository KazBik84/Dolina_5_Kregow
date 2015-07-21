require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      #login_as(user, :scope => :user) 
      sign_in @user
      get :show, id: @user.id  
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "render show page correctly" do
      expect(response).to render_template(:show)
    end
    it "assigns @user variable correctly" do
      expect(assigns(:user)).to eq(@user)
    end
  end

end
