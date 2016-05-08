# frozen_string_literal: true
class AddUserToBucketlist < ActiveRecord::Migration
  def change
    add_reference :bucketlists, :user, index: true, foreign_key: true
  end
end
