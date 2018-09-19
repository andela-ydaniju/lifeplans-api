# frozen_string_literal: true

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

FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    password { Faker::Name.name }
  end
end
