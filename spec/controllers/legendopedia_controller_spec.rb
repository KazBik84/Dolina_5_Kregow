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
  
  describe "POST show_schools" do
      
    before(:each) do
      post :show_schools, clans: "Smok", school_classes: "Bushi"
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
  
  describe "GET spells" do
        
    before(:each) do
      get :spells
    end
      
    it "should have http status success" do
      expect(response).to have_http_status(:success)
    end
      
    it "should render spells template" do
      expect(response).to render_template(:spells)
    end
  end
  
  describe "POST show_spells" do
  
    before(:each) do
      post :show_spells, elements: "Ogień", krag: "1", tag: "Grom"
    end
      
    it "should have success http status" do
      expect(response).to have_http_status(:success)
    end
      
    it "should render show_spells template" do
      expect(response).to render_template(:show_spells)
    end
      
    it "has not nil :elements attr" do
      expect(assigns(:elements)).to_not be_nil
    end
    
    it "has corrcet :elements value" do
      expect(assigns(:elements)).to eq("Ogień")
    end  
      
    it "has not nil kregi attr" do
      expect(assigns(:kregi)).to_not be_nil
    end
      
    it "has correct :kregi value" do
      expect(assigns(:kregi)).to eq("1")
    end 
      
    it "has not nil :tags attr" do
      expect(assigns(:tags)).to_not be_nil
    end
      
    it "has correct :tags value" do
      expect(assigns(:tags)).to eq("Grom")
    end  
  end
  
  describe "GET traits" do

    before(:each) do
      get :traits
    end

    it "should have success status" do
      expect(response).to have_http_status(:success)
    end
      
    it "should have render traits template" do
      expect(response).to render_template(:traits)
    end
  end
  
  describe "POST show_traits" do

    before(:each) do
      post :show_traits, kind: "Zaleta", types: "Fizyczna", to: "1", from: "4"
    end
      
    it "should have success status" do
      expect(response).to have_http_status(:success)
    end
      
    it "should have render show_traits template" do
      expect(response).to render_template(:show_traits)
    end 

    it "has not nil :kind" do
      expect(assigns(:kind)).to_not be_nil
    end
    
    it "has corrcet :kind" do
      expect(assigns(:kind)).to eq("Zaleta")
    end

    it "has not nil :types" do
      expect(assigns(:types)).to_not be_nil
    end
    
    it "has corrcet :types value" do
      expect(assigns(:types)).to eq("Fizyczna")
    end
      
    it "has not nil :from attr" do
      expect(assigns(:from)).to_not be_nil
    end
    
    it "has corrcet :from value" do
      expect(assigns(:from)).to eq("4")
    end
      
    it "has not nil :to attr" do
      expect(assigns(:to)).to_not be_nil
    end
    
    it "has corrcet :to value" do
      expect(assigns(:to)).to eq("1")
    end                        
      
    it "has not nil :values attr" do
      expect(assigns(:values)).to_not be_nil
    end
      
    it "has correct :values attr" do
      expect(assigns(:values)).to eq(["1", "2", "3", "4", "Różna"])
    end          
  end 

  describe "get #Clans" do

    before(:each) do
      get :clans
    end
      
    it "should have redirect status" do
      expect(response).to have_http_status(:success)
    end 
      
    it "shoud be redirected to login path" do
      expect(response).to render_template(:clans)
    end
  end

  describe "post #Clans" do

    before(:each) do
      @sample_clan = FactoryGirl.create(:clan)
      post :show_clan, clan_name: "Krab"
    end 

    it "should have http success status" do
      expect(response).to have_http_status(:success)
    end

    it "should render correct template" do
      expect(response).to render_template(:show_clan)
    end

    it "has not nil params[:clan_name] attr" do
      expect(assigns(:clan)).to_not be_nil
    end

    it "should have proper clan_name value" do
      expect(assigns(:clan)).to eq(@sample_clan)
    end
  end

  describe "GET skills" do

    before(:each) do 
      get :skills
    end

    it "should have success http status" do
      expect(response).to have_http_status(:success)
    end

    it "should render skills template" do
      expect(response).to render_template(:skills)
    end
  end     
end
