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

FactoryGirl.define do
  factory :item do
    description Faker::Hipster.sentence
    bucketlist_id Faker::Number.digit
    done false
  end
end
