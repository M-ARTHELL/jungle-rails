require 'rails_helper'
require './app/models/user.rb'


RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.create({
        first_name: "bill",
        last_name: "nye",
        email: "scienceguy@gmail.com",
        password:"badpassword123",
        password_confirmation: "badpassword123"})
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create({
        first_name: "bill",
        last_name: "nye",
        email: "scienceguy@gmail.com",
        password:"badpassword123",
        password_confirmation: "badpassword123"})
    end

    it "is invalid when password is < 5" do
      @user.password = "pass"
      @user.password_confirmation = "pass"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "is invalid when password is < 5" do
      @user.password = "pass"
      @user.password_confirmation = "pass"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "is valid when there is a space before the email" do
      @user.email = " scienceguy@gmail.com"
      expect(@user).to be_valid
    end

    it "is valid when there is a space after the email" do
      @user.email = "scienceguy@gmail.com "
      expect(@user).to be_valid
    end

    it "is valid even when the email is in the wrong case" do
      @user.email = "ScIeNcEgUy@GmAiL.cOm"
      expect(@user).to be_valid
    end
  end

end