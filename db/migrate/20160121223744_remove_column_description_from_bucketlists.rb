# frozen_string_literal: true

class RemoveColumnDescriptionFromBucketlists < ActiveRecord::Migration[5.2]
  def change
    remove_column :bucketlists, :description
  end
end
