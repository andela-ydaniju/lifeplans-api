# frozen_string_literal: true
class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
