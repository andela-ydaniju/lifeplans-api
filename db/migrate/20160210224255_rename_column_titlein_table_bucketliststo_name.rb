# frozen_string_literal: true
class RenameColumnTitleinTableBucketliststoName < ActiveRecord::Migration
  def change
    rename_column :bucketlists, :title, :name
  end
end
