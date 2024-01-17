class CreateDailyPredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_predictions do |t|
      t.date :date
      t.decimal :opening_price, precision: 15, scale: 2
      t.decimal :closing_price, precision: 15, scale: 2
      t.decimal :high, precision: 15, scale: 2
      t.decimal :low, precision: 15, scale: 2
      t.time :high_time
      t.time :low_time
      t.text :rationale
      t.string :status

      t.timestamps
    end
  end
end
