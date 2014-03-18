require 'spec_helper'

describe User do
  	before do
  		@user = User.new(name: "example", email: "user@mail.com", password: "password", password_confirmation: "password")
  	end

  	subject { @user }

  	it { should respond_to(:name) }
  	it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }

  	it { should be_valid }

  	describe "When name is not submitted" do
  		before { @user.name = "" }
  		it { should_not be_valid }
  	end

  	describe "when email is not submitted" do
  		before { @user.email = "" }
  		it { should_not be_valid }
  	end

  	describe "when submitted name is too long" do
  		before { @user.name = "a" * 51 }
  		it { should_not be_valid }
  	end

  	describe "when email format is invalid" do
  		it "should be invalid" do 
  			addresses = %w[user@foo,com user_at_foo.org expamle.user@foor.foo@bar.com foo@bar+bax.com]
  			addresses.each do |invalid_address|
  				@user.email = invalid_address
  				expect(@user).not_to be_valid
  			end
  		end
  	end

  	describe "when email format is valid" do
  		it "should be valid" do 
  			addresses = %w[user@foo.com user@foo1.org]
  			addresses.each do |valid_address|
  				@user.email = valid_address
  				expect(@user).to be_valid
  			end
  		end
  	end

  	describe "when email address already used" do
  		before do
  			user_with_the_same_email = @user.dup
  			user_with_the_same_email.email = @user.email.upcase
  			user_with_the_same_email.save
  		end

  		it { should_not be_valid }
  	end

    describe "when password is not present" do
      before do
        @user = User.new(name: "example", email: "user@mail.com", password: " ", password_confirmation: " ")
      end
      it { should_not be_valid }
    end

    describe "when 2 password doesn't match" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "password is not long enought" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should_not be_valid }
    end

    describe "return values of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by(email: @user.email) }

      describe "with valid pass" do
        it { should eq found_user.authenticate(@user.password) }  
      end

      describe "with invalid pass" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }

        it { should_not eq user_for_invalid_password }
        specify { expect(user_for_invalid_password).to be_false }
      end
    end
end
