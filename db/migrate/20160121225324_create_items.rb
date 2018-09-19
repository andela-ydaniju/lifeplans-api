# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :description
      t.references :bucketlist, index: true, foreign_key: true
      t.boolean :done

      t.timestamps null: false
    end
  end
end
