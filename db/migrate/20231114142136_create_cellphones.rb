class CreateCellphones < ActiveRecord::Migration[7.1]
  def change
    create_table :cellphones do |t|
      t.string :number
      t.boolean :kind
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
