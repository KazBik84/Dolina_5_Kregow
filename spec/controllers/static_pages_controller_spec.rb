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

end
