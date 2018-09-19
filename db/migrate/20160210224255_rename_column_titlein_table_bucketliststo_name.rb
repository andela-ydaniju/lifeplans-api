# frozen_string_literal: true

class RenameColumnTitleinTableBucketliststoName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bucketlists, :title, :name
  end
end
