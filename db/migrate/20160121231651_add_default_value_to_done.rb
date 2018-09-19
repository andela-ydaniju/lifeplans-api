# frozen_string_literal: true

class AddDefaultValueToDone < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :done, :boolean, default: true
  end
end
