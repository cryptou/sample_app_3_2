require 'spec_helper'

describe "User pages" do
  subject { page }
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_title_and_header(user.name) }
  end
  
  describe "signup page" do
    before { visit signup_path }
    it { should have_title_and_header('Sign up') }
  end
  
  describe "signup" do
    before { visit signup_path }
    
    describe "error message" do
      before { click_button "Sign up" }
      
      let(:error) { 'errors prohibited this user from being saved' }
      
      it { should have_title('Sign up') }
      it { should have_content(error) }
    end
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end
    end
    
    describe "with valid information" do
      before { valid_signup_information }
      
      describe "after saving the user" do
        before { click_button "Sign up" }
        let(:user) { User.find_by_email('user@example.com') }
        
        it { should have_title(user.name) }
        it { should have_success_message('Welcome') }
        it { should have_link('Sign out')}
      end
      
      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end
    end
  end
end