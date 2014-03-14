require 'spec_helper'

describe "Static pages" do
  	
  	# This is a symbol for "Demo app"
	let(:base_title) { "Demo app" }
  subject { page }

  	# Test for home page
  	describe "Home page" do
	    before { visit root_path }

	    it { should have_content('Demo app') }  

	    it { should have_title(full_title('')) }
      
    end # Home page


  	# Test for help page
  	describe "Help page" do
  		before { visit help_path }

  		it { should have_content('Help') }

	    it { should have_title(full_title('help')) }
  	end # Help page


  	# Test for about page
  	describe "About page" do
      before { visit about_path }

  		it { should have_content('Trung Doan') }

	    it { should have_title('about') }
  	end # About page


  	# Test for contact page
  	describe "Contact page" do
      before { visit contact_path }
  		
  		it { should have_content('trungtrong456@gmail.com') }

      it { should have_title('contact') } 
  	end # Contact page
end # Static pages
