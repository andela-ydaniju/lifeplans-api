# frozen_string_literal: true

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

FactoryBot.define do
  factory :item do
    name Faker::Hipster.sentence
    bucketlist_id 1
    done false
  end
end
