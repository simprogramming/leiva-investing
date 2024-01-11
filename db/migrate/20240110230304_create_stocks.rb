class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.float :price
      t.string :status

      t.timestamps
    end
  end
end
