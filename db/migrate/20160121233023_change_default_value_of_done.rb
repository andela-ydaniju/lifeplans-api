# frozen_string_literal: true

class ChangeDefaultValueOfDone < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :done, :boolean, default: false
  end
end
