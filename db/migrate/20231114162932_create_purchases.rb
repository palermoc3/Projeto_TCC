# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.float :price
      t.boolean :paid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
