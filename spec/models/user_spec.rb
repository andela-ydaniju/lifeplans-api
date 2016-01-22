require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) do
    create(:user)
  end

  context "when initialized" do
    it "is valid with correct attributes" do
      expect(user).to be_valid
    end
  end
end
