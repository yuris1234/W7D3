require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe 'uniqueness' do
    before(:each) do
      FactoryBot.create(:user)
    end
    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
  end

  describe "#password=" do
    # let (:user1) {User.new(
    #   username: "Yuri",
    #   password: "123456"
    # )}  
      let(:user){FactoryBot.create(:user)}
    it "Should set the password for the user" do
      expect(user.password).to eq("password")
    end
  end

  describe "#is_password?" do
      let(:user){FactoryBot.create(:user)}
    
    it "should return true if the password is correct" do
      expect(user.is_password?("password")).to be true
    end
    context "with an incorrect password" do
      it "should return false" do
        expect(user.is_password?("eeeeee")).to be false
      end
    end
  end

  describe "::find_by_credentials" do
      let(:user){FactoryBot.create(:user)}
    context "if the user exists" do
      it "should return the user that matches the credentials" do
        expect(User.find_by_credentials(user.username, "password")).to eq user
      end
    end
    context "if the user does not exist" do
      it "should return nil" do
        
      end
    end
  end
end
