require 'rails_helper'

RSpec.describe TagsController, :type => :controller do

	context "User not logged in" do
		
		describe "GET #index" do
			it "redirect to ideas path, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :index
				assigns(:tags).should eq(nil)
				response.should redirect_to ideas_path
			end
		end

		describe "GET #show" do
			it "redirect to ideas path, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :show, id: tag
				assigns(:tags).should eq(nil)
				response.should redirect_to ideas_path
			end
		end

		describe "GET #new" do
			it "doesn't get new, if not moderator" do
				get :new
				response.should redirect_to ideas_path
			end
		end

		describe "GET #edit" do
			it "doesn't edit, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :edit, id: tag
				response.should redirect_to ideas_path
			end
		end

		describe "POST #create" do
			it "doesn't create new, if not moderator" do
				expect{
				post :create, tag: FactoryGirl.attributes_for(:tag)
				}.to_not change(Tag, :count)
				response.should redirect_to ideas_path
			end
		end

		describe "PUT update" do
			it "doesn't update name, if not moderator" do
				@tag = FactoryGirl.create(:tag)		        
		        put :update, id: @tag, tag: FactoryGirl.attributes_for(:tag, text: "vaihdettu")	        
		        @tag.reload	        
		        @tag.text.should eq("tag text")
			end
		end

		describe "DELETE destroy" do
			it "don't destroy, if not admin" do
				tag = FactoryGirl.create(:tag)
		        expect{delete :destroy, id: tag}.to_not change(Tag, :count)
			end
		end
	end


	context "moderator logged in" do
		before :each do
			current_user = FactoryGirl.create(:user_moderator)
		    session[:user_id] = current_user.id
		end

		describe "GET #index" do
			it "populate array of tags" do
				tag = FactoryGirl.create(:tag)
				get :index
				assigns(:tags).should eq([tag])
				response.should render_template :index
			end
		end

		describe "GET #show" do
			it "assigns the requested tag to @tag" do
		    tag = FactoryGirl.create(:tag)		    
			get :show, id: tag		
			assigns(:tag).should eq(tag)
			response.should render_template :show		
			end
		end

		describe "PUT update" do
			it "update name" do
				@tag = FactoryGirl.create(:tag)		        
		        put :update, id: @tag, tag: FactoryGirl.attributes_for(:tag, text: "vaihdettu")	        
		        @tag.reload	        
		        @tag.text.should eq("vaihdettu")
			end
		end

		describe "POST #create" do
			it "create new tag, if moderator" do
				expect{
				post :create, tag: FactoryGirl.attributes_for(:tag)
				}.to change(Tag, :count).by(1)				
			end			
		end

		describe "DELETE destroy" do
			it "destroy tag" do
				tag = FactoryGirl.create(:tag)
		        expect{delete :destroy, id: tag}.to change(Tag, :count).by(-1)
			end
		end
	end

	context "Basic user logged in" do
		before :each do
			current_user = FactoryGirl.create(:user_student)
		    session[:user_id] = current_user.id
		end

		describe "GET #index" do
			it "redirect to ideas path, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :index
				assigns(:tags).should eq(nil)
				response.should redirect_to ideas_path
			end
		end

		describe "GET #show" do
			it "redirect to ideas path, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :show, id: tag
				assigns(:tags).should eq(nil)
				response.should redirect_to ideas_path
			end
		end

		describe "GET #new" do
			it "doesn't get new, if not moderator" do
				get :new
				response.should redirect_to ideas_path
			end
		end

		describe "GET #edit" do
			it "doesn't edit, if not moderator" do
				tag = FactoryGirl.create(:tag)
				get :edit, id: tag
				response.should redirect_to ideas_path
			end
		end

		describe "POST #create" do
			it "doesn't create new, if not moderator" do
				expect{
				post :create, tag: FactoryGirl.attributes_for(:tag)
				}.to_not change(Tag, :count)
				response.should redirect_to ideas_path
			end
		end

		describe "PUT update" do
			it "doesn't update name, if not moderator" do
				@tag = FactoryGirl.create(:tag)		        
		        put :update, id: @tag, tag: FactoryGirl.attributes_for(:tag, text: "vaihdettu")	        
		        @tag.reload	        
		        @tag.text.should eq("tag text")
			end
		end

		describe "DELETE destroy" do
			it "don't destroy, if not admin" do
				tag = FactoryGirl.create(:tag)
		        expect{delete :destroy, id: tag}.to_not change(Tag, :count)
			end
		end
	end
end