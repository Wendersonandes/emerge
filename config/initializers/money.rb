# encoding : utf-8
MoneyRails.configure do |config|
  config.default_currency = :BRL
  config.no_cents_if_whole = false
  config.default_currency = :BRL
  config.no_cents_if_whole = false
  config.add_rate "BRL", "ARS", 0.223151671
  config.add_rate "ARS", "BRL", 0.223151671
  config.add_rate "BRL", "EUR", 0.223151671
  config.add_rate "EUR", "BRL", 0.223151671
  config.add_rate "BRL", "USD", 0.243425
  config.add_rate "USD", "BRL", 0.243425
  config.add_rate "BRL", "MXN", 4.4650899
  config.add_rate "MXN", "BRL", 4.4650899
  config.add_rate "BRL", "GBP", 5.245484
  config.add_rate "GBP", "BRL", 5.245484
end
