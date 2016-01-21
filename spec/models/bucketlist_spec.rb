require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  let(:bucketlist) do
    build(:bucketlist)
  end

  context "when initialized" do
    it "is valid with all attribute" do
      expect(bucketlist).to be_valid
    end
  end
end
