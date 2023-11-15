class AddTitleToAbouts < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :title, :string
  end
end
