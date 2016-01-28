require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) do
    build(:user)
  end

  context "when initialized" do
    it "is valid with correct attributes" do
      binding.pry
      expect(user).to be_valid
    end
  end
end
