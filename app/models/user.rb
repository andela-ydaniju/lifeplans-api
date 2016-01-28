class User < ActiveRecord::Base
  has_many :bucketlists
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }
end
