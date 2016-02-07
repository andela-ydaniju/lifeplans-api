# == Schema Information
#
# Table name: bucketlists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Bucketlist < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :user
  validates :title, length: { maximum: 50 }, presence: true
end
