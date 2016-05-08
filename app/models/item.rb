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

class Item < ActiveRecord::Base
  belongs_to :bucketlist

  validates :name, length: { minimum: 5 }, presence: true
end
