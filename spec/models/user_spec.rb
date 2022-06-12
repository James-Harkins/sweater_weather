require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }

    describe "email" do
      before do
        @user_1 = User.create!(email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it { should allow_value("cleavermovie@gmail.com").for(:email) }
      it { should_not allow_value("wokeupthismorning@gmail.com").for(:email) }
    end

    it { should validate_presence_of(:password) }
    it { should have_secure_password }

    it "should not have a password attribute and the password_digest attribute should be a hash" do
      user = User.create(email: "test@test.com", password: "password123", password_confirmation: "password123")

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("password123")
    end

    it "should have a unique api_key generated upon creation" do
      user_1 = User.create!(email: "test1@test.com", password: "password123", password_confirmation: "password123")
      user_2 = User.create!(email: "test2@test.com", password: "password123", password_confirmation: "password123")

      expect(user_1.api_key).not_to eq(user_2.api_key)
    end
  end
end
