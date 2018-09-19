# frozen_string_literal: true

class AddUserToBucketlist < ActiveRecord::Migration[5.2]
  def change
    add_reference :bucketlists, :user, index: true, foreign_key: true
  end
end
