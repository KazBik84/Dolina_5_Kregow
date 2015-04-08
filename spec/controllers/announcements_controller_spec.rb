require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  before(:each) do
  	@announcement = FactoryGirl.create(:announcement)
	end
	
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
		let(:nowy_news) do { title: "nowy tytul", message: "Nowa super duper wiadomosc" } 
		end
		
		before(:each) do
			put :update, id: @announcement.id, nowe_attr: nowy_news
			@announcement.reload
		end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "has the updated title value" do
    	expect(@announcement.title).to eql nowy_news[:title]
    end
    it "has the updated message value" do
    	expect(@announcement.message).to eql nowy_news[:title]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @announcement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy, id: @announcement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @announcement.id
      expect(response).to have_http_status(:success)
    end
  end

end
