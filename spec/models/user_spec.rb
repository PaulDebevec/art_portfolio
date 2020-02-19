require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
  end

  describe "roles" do
    it "can be created as an admin" do
      user = User.create(username: "admin",
                         password: "password",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

  end
end
