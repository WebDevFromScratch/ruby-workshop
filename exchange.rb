class Exchange
  EXCHANGE_RATES = {
    'EUR_USD' => 1.2,
    'USD_EUR' => 0.85
  }

  def convert(money, currency)
    amount_to_convert = money.amount
    input_currency = money.currency
    output_currency = currency
    exchange = "#{input_currency}_#{output_currency}"

    amount_to_convert * EXCHANGE_RATES["#{exchange}"]
  end
end
