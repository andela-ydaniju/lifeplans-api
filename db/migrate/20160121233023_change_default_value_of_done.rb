# frozen_string_literal: true
class ChangeDefaultValueOfDone < ActiveRecord::Migration
  def change
    change_column :items, :done, :boolean, default: false
  end
end
