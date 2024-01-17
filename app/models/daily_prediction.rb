class DailyPrediction < ApplicationRecord
  validates :opening_price, :closing_price, :high, :low, :high_time, :low_time, :rationale, :status, :date,
            presence: true

  enum status: { bullish: "bullish", bearish: "bearish", consolidation: "consolidation" }
  translate_enum :status
end
