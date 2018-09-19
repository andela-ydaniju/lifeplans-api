# frozen_string_literal: true

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

FactoryBot.define do
  factory :bucketlist do
    name { Faker::Hipster.word }
    user_id { 1 }
  end
end
