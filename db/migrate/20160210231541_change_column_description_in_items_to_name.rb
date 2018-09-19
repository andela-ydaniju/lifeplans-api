# frozen_string_literal: true

class ChangeColumnDescriptionInItemsToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :description, :name
  end
end
