require 'spec_helper'

describe "User pages" do
	subject { page }

  	describe "signup page" do
    	before { visit signup_path }

    	it { should have_content('Sign up') }
    	it { should have_title(full_title('Sign up')) }	
  	end

  	describe "profile page" do
  		let(:user) { FactoryGirl.create(:user) }
  		before { visit user_path(user) }

  		it { should have_content(user.name) }
  		it { should have_title(user.name) } 
  	end

    describe "signup" do
      before { visit signup_path }

      let(:submit) { "Create an account" }
      
      describe "with invalid input" do
        it 'should not create an account' do
          expect { click_button submit }.not_to change(User, :count)
        end
      end

      describe "with valid input" do
        before do
          fill_in "Name", with: "Trung"
          fill_in "Email", with: "trungtrong456@gmail.com"
          fill_in "Password", with: "totalwar"
          fill_in "Confirmation", with: "totalwar"
        end

        it 'should create a user' do
          expect { click_button submit }.to change(User, :count).by(1)
        end
      end
    end
end
