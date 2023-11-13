# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.integer :role
      t.string :state
      t.string :cep
      t.string :street
      t.integer :number

      t.timestamps
    end
  end
end
