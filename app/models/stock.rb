class Stock < ApplicationRecord
  searchable :name, :symbol

  validates :name, :symbol, :price, :status, presence: true

  enum status: { buying: "buying", selling: "selling", watching: "watching" }
  enum distribution: { monthly: "monthly", quarterly: "quarterly"}
  translate_enum :status
  translate_enum :distribution
end
