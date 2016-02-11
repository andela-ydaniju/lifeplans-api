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

class ItemSerializer < ActiveModel::Serializer
  include SerializerHelper

  attributes :id, :name, :date_created, :date_modified, :done
end
