json.array! @stocks do |stock|
  json.extract! stock, :id, :name, :symbol, :price, :status
end
