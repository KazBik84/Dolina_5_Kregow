require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
  
    context "user_signed_in?" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        # sign_in @user daje nam zalogowanego usera
        #  i pozwala testować części kodu dostępne tylko
        #  dla zalogowanych userów
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
    
    context "user not signed in can`t see users pages" do
      before(:each) do
        get :show, id: 3
      end
      
      it "should be redirected to sign in  page" do
        expect(response).to redirect_to new_user_session_path
      end
      
      it "should have redirect http status" do
        expect(response).to have_http_status(:redirect)
      end
    end
    
    context "sign in user should not be able to see other users pages" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @user2 = FactoryGirl.build(:user)  
        @user2.update_attributes(username: "Kamila", email: "Kamila@wp.pl")    
        @user2.save 
        sign_in @user    
        get :show, id: @user2.id    
      end
      
      it "should be redirected to root" do
        expect(response).to redirect_to root_path
      end
      
      it "should be redirected" do 
        expect(response).to have_http_status(:redirect)      
      end
    end
  end
  
  describe "GET #index" do

    context "curren_user = true, admin = true" do
    
      before(:each) do
        @user = FactoryGirl.create(:user)  
        @user.update_attribute(:admin, true)
        sign_in @user
        get :index        
      end
      it "should have success status" do
        expect(response).to have_http_status(:success)
      end
      
      it "should render index pages" do
        expect(response).to render_template(:index)
      end
      
      it "should assign @users variable correctly" do
        expect(assigns(:users)).to eq(User.all)
      end
      
    end
    
    context "current_user = true, admin = false" do
      before(:each) do
        @user = FactoryGirl.create(:user)  
        sign_in @user
        get :index        
      end  
      
      it "should have http status redirect" do
        expect(response).to have_http_status(:redirect)
      end    
      
      it "should redirect to root" do
        expect(response).to redirect_to root_path
      end
      
    end 
   
    context "current_user = false" do
      before(:each) do
        get :index
      end
      
      it "should have http status redirect" do
        expect(response).to have_http_status(:redirect)
      end    
      
      it "should redirect to log in" do
        expect(response).to redirect_to  new_user_session_path
      end 
     
    end
   
  end
end
