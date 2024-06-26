class Stock < ApplicationRecord
  searchable :name, :symbol

  validates :name, :symbol, :price, :status, :api_symbol, presence: true

  enum status: { buying: "buying", selling: "selling", watching: "watching" }
  translate_enum :status
  enum distribution: { monthly: "monthly", quarterly: "quarterly" }
  translate_enum :distribution
end
