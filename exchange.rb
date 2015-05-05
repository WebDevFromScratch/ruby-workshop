require 'json'

CURRENCIES = JSON.parse(IO.read('currencies.json'))
EXCHANGE_RATES = JSON.parse(IO.read('exchange_rates.json'))

class InvalidCurrency < StandardError
end

class Exchange
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
