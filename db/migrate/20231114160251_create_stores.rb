# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.integer :kind
      t.integer :theme
      t.integer :payroll_day
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
