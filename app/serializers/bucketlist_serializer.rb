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

class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :date_created, :date_modified, :created_by
  has_many :items, serializer: ItemSerializer

  def created_by
    object.user.username
  end

  def date_created
    object.created_at.to_formatted_s(:db)
  end

  def date_modified
    object.updated_at.to_formatted_s(:db)
  end
end
