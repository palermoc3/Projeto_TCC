class CreateSubCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_categories do |t|
      t.integer :name
      t.integer :quantity
      t.references :Category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
