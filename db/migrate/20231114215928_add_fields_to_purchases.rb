class AddFieldsToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :packSize, :float
    add_column :purchases, :packPrice, :float
    add_column :purchases, :receive, :boolean
  end
end
