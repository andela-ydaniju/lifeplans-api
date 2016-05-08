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

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified, :done

  def date_created
    object.created_at.to_formatted_s(:db)
  end

  def date_modified
    object.updated_at.to_formatted_s(:db)
  end
end
