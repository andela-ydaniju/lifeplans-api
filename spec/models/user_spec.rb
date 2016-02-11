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
  end
end
