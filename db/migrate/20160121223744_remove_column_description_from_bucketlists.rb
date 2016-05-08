# frozen_string_literal: true
class RemoveColumnDescriptionFromBucketlists < ActiveRecord::Migration
  def change
    remove_column :bucketlists, :description
  end
end
