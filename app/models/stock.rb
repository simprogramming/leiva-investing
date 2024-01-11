class Stock < ApplicationRecord
  searchable :name, :symbol

  validates :name, :symbol, :price, :status, presence: true

  enum status: { buying: "buying", selling: "selling", watching: "watching" }
  translate_enum :status
end
