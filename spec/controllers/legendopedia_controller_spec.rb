require 'rails_helper'

RSpec.describe LegendopediaController, type: :controller do

  describe "Get main" do
    
    before(:each) do
      get :main
    end
    it "returns proper http status" do
      expect(response).to have_http_status(:success)
    end
    it "render main view" do
      expect(response).to render_template(:main)
    end
  end
  
  describe "GET #schools" do
  
    before(:each) do
      get :schools
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "renders schools view" do
      expect(response).to render_template(:schools)
    end
  end
  
  describe "get show_schools" do
    before(:each) do
      get :show_schools, clans: "Smok", school_classes: "Bushi"
    end
    
    it "has param :clans not equal nil" do
      expect(assigns(:clans)).to_not be_nil
    end
    
    it "has correct :clans value" do
      expect(assigns(:clans)).to eq("Smok")
    end
    
    it "has not nil :school_classes attr" do
      expect(assigns(:school_classes)).to_not be_nil
    end
    
    it "has corret :school_classes value" do
      expect(assigns(:school_classes)).to eq("Bushi")
    end
    
    it "has not nil :chosen_schools attr" do
      expect(assigns(:chosen_schools)).to_not be_nil
    end
    
  end

end
