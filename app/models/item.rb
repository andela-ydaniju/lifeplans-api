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

class Item < ActiveRecord::Base
  belongs_to :bucketlist

  validates :description, length: { minimum: 5 }, presence: true
end
