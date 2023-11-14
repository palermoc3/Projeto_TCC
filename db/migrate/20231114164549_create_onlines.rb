class CreateOnlines < ActiveRecord::Migration[7.1]
  def change
    create_table :onlines do |t|
      t.float :packSize
      t.float :packPrice
      t.boolean :receive
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
