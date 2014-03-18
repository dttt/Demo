require 'spec_helper'

describe "Static pages" do
  	
  	# This is a symbol for "Demo app"
	let(:base_title) { "Demo app" }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  	# Test for home page
  	describe "Home page" do
	    before { visit root_path }

	    let(:heading) { 'Demo app' }  
	    let(:page_title) { '' }
    end # Home page


  	# Test for help page
  	describe "Help page" do
  		before { visit help_path }

  		let(:heading) { 'Help' }
	    let(:page_title) { 'help' }

      it_should_behave_like "all static pages"
  	end # Help page


  	# Test for about page
  	describe "About page" do
      before { visit about_path }

  		let(:heading) { 'Trung Doan' }
	    let(:page_title) { 'about' }

      it_should_behave_like "all static pages"
  	end # About page


  	# Test for contact page
  	describe "Contact page" do
      before { visit contact_path }
  		
  		let(:heading) { 'trungtrong456@gmail.com' }
      let(:page_title) { 'contact' } 

      it_should_behave_like "all static pages"

      it { should have_selector('h1', text: 'trungtrong456@gmail.com') }
  	end # Contact page
end 
