# == Schema Information
#
# Table name: bucketlists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bucketlist < ActiveRecord::Base
  has_many :items
  validates :title, length: { maximum: 50 }, presence: true
end
