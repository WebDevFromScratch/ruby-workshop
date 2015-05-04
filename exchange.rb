class InvalidCurrency < StandardError
end

class Exchange
  CURRENCIES = ['USD', 'EUR', 'CHF', 'JPY', 'PLN']

  EXCHANGE_RATES = {
    'USD_EUR' => 0.896288,
    'USD_GBP' => 0.661337,
    'USD_CHF' => 0.933871,
    'USD_JPY' => 120.149,
    'USD_PLN' => 3.61313,
    'EUR_USD' => 1.11569,
    'EUR_GBP' => 0.737999,
    'EUR_CHF' => 1.04189,
    'EUR_JPY' => 134.023,
    'EUR_PLN' => 4.03059,
    'GBP_USD' => 1.51196,
    'GBP_EUR' => 1.35543,
    'GBP_CHF' => 1.41229,
    'GBP_JPY' => 181.662,
    'GBP_PLN' => 5.46388,
    'CHF_USD' => 1.07065,
    'CHF_EUR' => 0.959759,
    'CHF_GBP' => 0.708088,
    'CHF_JPY' => 128.656,
    'CHF_PLN' => 3.86824,
    'JPY_USD' => 0.00832177,
    'JPY_EUR' => 0.00746079,
    'JPY_GBP' => 0.00550378,
    'JPY_CHF' => 0.00777398,
    'JPY_PLN' => 0.0300647,
    'PLN_USD' => 0.276790,
    'PLN_EUR' => 0.248040,
    'PLN_GBP' => 0.182961,
    'PLN_CHF' => 0.258460,
    'PLN_JPY' => 33.2442
  }

  def convert(money, currency)
    amount_to_convert = money.amount
    input_currency = money.currency
    output_currency = currency
    wrong_currency = missing_currency(input_currency, output_currency)

    raise InvalidCurrency, "Invalid currency: #{wrong_currency}" unless currencies_present?(input_currency, output_currency)

    if input_currency == output_currency
      amount_to_convert
    else
      amount_to_convert * EXCHANGE_RATES["#{input_currency}_#{output_currency}"]
    end
  end

  private

  def currencies_present?(input_currency, output_currency)
    CURRENCIES.include?(input_currency) && CURRENCIES.include?(output_currency)
  end

  def missing_currency(input_currency, output_currency)
    CURRENCIES.include?(input_currency) ? output_currency : input_currency
  end
end
