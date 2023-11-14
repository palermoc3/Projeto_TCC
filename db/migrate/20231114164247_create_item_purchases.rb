class CreateItemPurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :item_purchases do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
