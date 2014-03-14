require 'spec_helper'

describe "Static pages" do
  	
  	# This is a symbol for "Demo app"
	let(:base_title) { "Demo app" }

  	# Test for home page
  	describe "Home page" do
	    
	    # Test content
	    it "should have content 'Demo app'" do
	    	visit '/static_pages/home'
	    	expect(page).to have_content('Demo app')  
	    end # content

	    # Test title
	    it "should have title 'Demo app | home'" do
	    	visit '/static_pages/home'
	    	expect(page).to have_title("#{base_title} | home")
	    end # Title
  	end # Home page


  	# Test for help page
  	describe "Help page" do
  		
  		# Test header 
  		it "should have content 'Help'" do
  			visit '/static_pages/help'
  			expect(page).to have_content('Help')
  		end #content

  		# Test title
	    it "should have title 'Demo app | help'" do
	    	visit '/static_pages/help'
	    	expect(page).to have_title('help')
	    end # Title
  	end # Help page


  	# Test for about page
  	describe "About page" do

  		# Test header
  		it "should have my name 'Trung Doan'" do
  			visit '/static_pages/about'
  			expect(page).to have_content('Trung Doan')
  		end # Test header

  		# Test title
	    it "should have title 'Demo app | about'" do
	    	visit '/static_pages/about'
	    	expect(page).to have_title('about')
	    end # Title
  	end # About page


  	# Test for contact page
  	describe "Contact page" do

  		# Test header
  		it "should have my email 'trungtrong456@gmail.com'" do
  			visit '/static_pages/contact'
  			expect(page).to have_content('trungtrong456@gmail.com')
  		end # Header
  	end # Contact page
end # Static pages
