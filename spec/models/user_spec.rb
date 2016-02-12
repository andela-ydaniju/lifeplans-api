# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  auth_token      :string
#

require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) do
    build(:user)
  end

  context "when initialized" do
    it "is valid with correct attributes" do
      expect(user).to be_valid
    end

    it "is valid with correct attributes" do
      expect(user).to be_valid
    end

    it "is invalid with password less than 6 characters" do
      user.password = "repo"
      expect(user).to be_invalid
    end

    it "is invalid if username is already"\
     "taken even with different case" do
      user.save
      dup_user = user.dup
      dup_user.username.upcase
      dup_user.save
      expect(dup_user).to be_invalid
    end
  end
end
