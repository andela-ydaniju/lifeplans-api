class RenameColumnTitleinTableBucketliststoName < ActiveRecord::Migration
  def change
    rename_column :bucketlists, :title, :name
  end
end
