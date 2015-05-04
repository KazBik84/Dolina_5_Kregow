require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
	
  describe "GET #new" do
  	before(:each) do
  		get :new
  	end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "renders new template" do
    	expect(response).to render_template :new
    end
  end

  describe "POST #create" do
  	context 'with valid attributes' do
  		before(:each) do
  			post :create, announcement: attributes_for(:announcement)
  		end
  		
  		it "returns redirect http status" do
  			expect(response).to have_http_status(:redirect)
  		end
  		it 'redirect to root_path' do
  			expect(response).to redirect_to(root_path)
  		end
  		it 'will set flash[:success]' do
  			expect(flash[:success]).to be_present
  		end
  		it 'create the announcement object' do
  			expect(Announcement.count).to eq(1)
  		end
  	end
  	
  	context "with title equal nil" do
  		before(:each) do
  			post :create, announcement: attributes_for(:announcement, title: nil)
  		end
  		
  		it "returns http status success" do
  			expect(response).to have_http_status(:success)
  		end
  		it "renders new template" do
  			expect(response).to render_template :new
  		end	
  		it "doesn`t create Announcement object" do
  			expect(Announcement.count).to eq(0)
  		end
  	end
  	context "with message equal nil" do
  		before(:each) do
  			post :create, announcement: attributes_for(:announcement, message: nil)
  		end
  		
  		it "returns http status success" do
  			expect(response).to have_http_status(:success)
  		end
  		it "renders new template" do
  			expect(response).to render_template :new
  		end	
  		it "doesn`t create Announcement object" do
  			expect(Announcement.count).to eq(0)
  		end
  	end  	
  end

  describe "GET #edit" do
  
		let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 		 
		
  	before(:each) do
  		get :edit, id: dummy_post.id
  	end
    it "returns http success" do
			expect(response).to have_http_status(:success)
    end
    it "renders edit template" do
    	expect(response).to render_template :edit
    end
    it "assigns @announcement variable corectly" do
    	expect(assigns(:announcement)).to eq(dummy_post)
    end
  end  
  describe "GET #update" do
  
		let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end    

		context	"update with valid attributes" do
		
			let(:attr) do 
		  	{ title: 'new title', message: 'new content' }
			end		
				
			before(:each) do
				put :update, id: dummy_post.id, announcement: attr
			end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			it "redirect to root_path" do
				expect(response).to redirect_to(root_path)
			end
			it "has the updated title value" do
				dummy_post.reload
				expect(dummy_post.title).to eq(attr[:title])
			end
			it "has the updated message value" do
				dummy_post.reload
				expect(dummy_post.message).to eq(attr[:message]) 
			end
			it "has success flash message" do
				expect(flash[:success]).to be_present
			end
		end
		context "invalid title" do

			let(:attr) do 
		  	{ title: '', message: 'new content' }
			end	
			before(:each) do
				put :update, id: dummy_post.id, announcement: attr
			end
			
			it " has http status success" do
				expect(response).to have_http_status(:success)
			end			
			it "has render the edit template" do
				expect(response).to render_template(:edit)
			end
			it "will no change dummy_post title" do
				dummy_post.reload
				expect(dummy_post.title).to_not eq(attr[:title])
			end
			it "will no change dummy_post message" do
				dummy_post.reload
				expect(dummy_post.message).to_not eq(attr[:message])
			end
		end
		context "invalid message" do

			let(:attr) do 
		  	{ title: 'jakis tytul', message: '' }
			end	
			before(:each) do
				put :update, id: dummy_post.id, announcement: attr
			end
			
			it " has http status success" do
				expect(response).to have_http_status(:success)
			end			
			it "has render the edit template" do
				expect(response).to render_template(:edit)
			end
			it "will no change dummy_post title" do
				dummy_post.reload
				expect(dummy_post.title).to_not eq(attr[:title])
			end
			it "will no change dummy_post message" do
				dummy_post.reload
				expect(dummy_post.message).to_not eq(attr[:message])
			end
		end		
  end

  describe "GET #destroy" do
		let(:delete_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 	
		  
  	before(:each) do
    	delete :destroy, id: delete_post.id
  	end
  	
    it "returns http redirect" do

			expect(response).to have_http_status(:redirect)
    end
    it "redirect to root_path" do
    	expect(response).to redirect_to(root_path)
    end
    it "have flash success" do
    	expect(flash[:success]).to be_present
    end
  end

  describe "GET #show" do
  
  	let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 
		
  	before(:each) do
  		get :show, id: dummy_post.id
  	end
  	
    it "assigns @announcement corectly" do
			expect(assigns(:announcement)).to eq(dummy_post)
    end
    it "has http status success" do
    	expect(response).to have_http_status(:success)
    end
    it "renders show template" do
    	expect(response).to render_template(:show)
    end
  end
end
