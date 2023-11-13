# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators do |t|
      t.string :cnpj

      t.timestamps
    end
  end
end
