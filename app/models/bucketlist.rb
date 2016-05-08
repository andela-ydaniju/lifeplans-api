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

class Bucketlist < ActiveRecord::Base
  has_many :items
  belongs_to :user
  validates :name, length: { maximum: 50 }, presence: true
end
