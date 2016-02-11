# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  name          :text
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
    it "is valid with all attributes correct" do
      expect(item).to be_valid
    end

    it "has name attribute not less than 5 letters" do
      item.name = "a" * 4
      expect(item).to be_invalid
    end

    it "is invalid if name is absent" do
      item.name = nil
      expect(item).to be_invalid
    end

    it "is invalid if name is empty" do
      item.name = ""
      expect(item).to be_invalid
    end
  end
end
