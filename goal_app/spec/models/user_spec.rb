require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    FactoryBot.create(:user)
  end
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password)}
  it { should validate_uniqueness_of(:username)}
  it {should validate_length_of (:password).is_at_least(6)}

  describe "#password=" do
    let (:user1) {User.new(
      username: "Yuri",
      password: "123456"
    )}
    it "Should set the password for the user" do
      expect(user1.password).to eq("123456")
    end
  end
end
