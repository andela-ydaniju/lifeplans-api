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

class User < ActiveRecord::Base
  has_many :bucketlists
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false },
                       presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
