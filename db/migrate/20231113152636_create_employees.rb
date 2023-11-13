# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :ctps
      t.float :salary_base
      t.integer :hours
      t.float :commission_percent

      t.timestamps
    end
  end
end
