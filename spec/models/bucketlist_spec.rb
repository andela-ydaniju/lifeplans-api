# == Schema Information
#
# Table name: bucketlists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  let(:bucketlist) do
    create(:bucketlist)
  end

  context "when initialized" do
    it "is valid with all attribute" do
      expect(bucketlist).to be_valid
    end

    it "is invalid with name attribute with length greater than 50" do
      bucketlist.name = "lo" * 50
      expect(bucketlist).to be_invalid
    end
  end
end
