require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
    it "renders home template" do
    	get :home
    	expect(response).to render_template :home
    end	
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
    it "renders contact template" do
    	get :contact
    	expect(response).to render_template :contact
    end	    
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
    it "renders about template" do
    	get :about
    	expect(response).to render_template :about
    end	    
  end
  
  describe "Get #to do" do
  	it "returns http success" do
  		get :to_do
  		expect(response).to have_http_status(:success)
  	end
  	it "renders to do temple" do
  		get :to_do
  		expect(response).to render_template :to_do
  	end
  end

end
