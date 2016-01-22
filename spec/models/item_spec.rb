# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  description   :text
#  bucketlist_id :integer
#  done          :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe Item, type: :model do
  let(:item) do
    create(:item)
  end

  context "when initialized" do
    it "is valid with all attributes complete" do
      expect(item).to be_valid
    end

    it "has description attribute not less than 20 letters" do
      item.description = "a" * 19
      expect(item).to be_invalid
    end
  end
end
