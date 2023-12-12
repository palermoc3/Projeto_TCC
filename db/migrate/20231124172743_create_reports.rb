# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.references :store, null: false, foreign_key: true
      t.float :monthly_sales
      t.date :date_report

      t.timestamps
    end
  end
end
