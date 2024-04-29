class AddFieldsToStock < ActiveRecord::Migration[7.0]
  def change
    change_table :stocks, bulk: true do |t|
      t.boolean :dividend, default: false
      t.float :yield
      t.string :distribution
      t.integer :position, uniq: true
      t.string :api_symbol
    end
  end
end
