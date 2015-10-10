require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

	describe "User not logged in" do
		let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 				
		before(:each) do 
			post :create, comment: attributes_for(:controller_comment), announcement_id: dummy_post.id, from_url: root_path
		end

		it "return redirect http status" do
			expect(response).to have_http_status(:redirect)
		end

		it "redirects to log in " do
			expect(response).to redirect_to new_user_session_path
		end
	end

	describe "User logged in but wrong user_id" do
		let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 				
		before(:each) do 
			@user = FactoryGirl.create(:user, id: "1")
			sign_in @user
			post :create, comment: attributes_for(:controller_comment, user_id: "2"), announcement_id: dummy_post.id, from_url: root_path
		end

		it "return redirect http status" do
			expect(response).to have_http_status(:redirect)
		end

		it "redirects to log in " do
			expect(response).to redirect_to root_path
		end
	end	

  describe "GET #create" do
		let(:dummy_post) do
			Announcement.create(title: "Testowy post", message: "Testowe message")
		end 		
  	context "With valid attributes" do
  	
  		before(:each) do
			@user = FactoryGirl.create(:user, id: "1")
			sign_in @user  			
  			post :create, comment: attributes_for(:controller_comment), announcement_id: dummy_post.id, from_url: root_path
  		end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			
			it "redirects to the given url" do
				expect(response).to redirect_to(root_path)
			end
			
			it "will create a comment in the db" do
				expect(Comment.count).to eq(1)
			end
		end

	
		context "Comment with nil content" do
		
		 before(:each) do
			@user = FactoryGirl.create(:user, id: "1")
			sign_in @user		 	
  			post :create, comment: attributes_for(:controller_comment, content: nil), announcement_id: dummy_post.id, from_url: root_path
  		end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			
			it "redirects to the root_path" do
				expect(response).to redirect_to(root_path)
			end
			
			it "will render a flash" do
				expect(flash).to_not be_present
			end
			
			it "will not create a comment in the db" do
				expect(Comment.count).to eq(0)
			end	
		end
		
		context "Comment with too long content" do
		
		 before(:each) do
				@user = FactoryGirl.create(:user, id: "1")
				sign_in @user		 	
  			post :create, comment: attributes_for(:controller_comment, content: %w("x"x256)), announcement_id: dummy_post.id
  		end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			
			it "redirects to the root_path" do
				expect(response).to redirect_to(root_path)
			end
			
			it "will not create a comment in the db" do
				expect(Comment.count).to eq(0)
			end	

		end			


		describe "GET #destroy" do
		
			let(:dummy_announcement) do
				Announcement.create(title:"a", message:"b")
			end
			
			let(:dummy_comment) do
				FactoryGirl.create(:comment, announcement_id: dummy_announcement.id)
			end
			
			context "comment destroy by owner" do 
				before(:each) do
					@user = FactoryGirl.create(:user, id: "1")
					sign_in @user				
					delete :destroy, id: dummy_comment.id, announcement_id: dummy_announcement.id, url: root_path
				end
			  it "returns http redirect" do
					expect(response).to have_http_status(:redirect)
			  end
			  it "redirects to url path" do
			  	expect(response).to redirect_to root_path
			  end
			  it "destroys an comment" do
			  	expect(dummy_announcement.comments.count).to eq(0)
			  end
			end

			context "comment destroy by admin" do 
				before(:each) do
					#@user musi isteniec żeby komentarz o user_id "1" mógł istenieć
					@user = FactoryGirl.create(:user, id: "1")
					@user_admin = FactoryGirl.create(:user, email: "admin@wp.pl", username: "Admin", id: "2", admin: true)
					sign_in @user_admin									
					delete :destroy, id: dummy_comment.id, announcement_id: dummy_announcement.id, url: root_path
				end
			  it "returns http redirect" do
					expect(response).to have_http_status(:redirect)
			  end
			  it "redirects to url path" do
			  	expect(response).to redirect_to root_path
			  end
			  it "destroys an comment" do
			  	expect(dummy_announcement.comments.count).to eq(0)
			  end
			end			
		end
	end

end

=begin		
		context "Comment with nil author" do
		
		 before(:each) do
  			post :create, comment: attributes_for(:controller_comment, author: nil), announcement_id: dummy_post.id
  		end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			
			it "redirects to the root_path" do
				expect(response).to redirect_to(root_path)
			end
			
			it "will render a flash" do
				expect(flash).to_not be_present
			end
			
			it "will not create a comment in the db" do
				expect(Comment.count).to eq(0)
			end	
		end
		
		context "Comment with too long author" do
		
		 before(:each) do
  			post :create, comment: attributes_for(:controller_comment, author: %w("x"x101)), announcement_id: dummy_post.id
  		end
			
			it "returns http redirect" do
				expect(response).to have_http_status(:redirect)
			end
			
			it "redirects to the root_path" do
				expect(response).to redirect_to(root_path)
			end
			
			it "will render a flash" do
				expect(flash).to_not be_present
			end
			
			it "will not create a comment in the db" do
				expect(Comment.count).to eq(0)
			end	
		end		
=end	
