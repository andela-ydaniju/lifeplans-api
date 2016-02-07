class ItemSerializer < ActiveModel::Serializer
  include SerializerHelper

  attributes :id, :description, :date_created, :date_modified, :done
end
