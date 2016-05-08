# frozen_string_literal: true
class ChangeColumnDescriptionInItemsToName < ActiveRecord::Migration
  def change
    rename_column :items, :description, :name
  end
end
