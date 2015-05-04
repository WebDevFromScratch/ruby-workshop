class Money
  def initialize(amount, currency)
    @amount = amount.to_f
    @currency = currency.to_s
  end

  def to_s
    "#{amount_with_two_decimals} #{@currency}"
  end

  def inspect
    "#<Money #{self.to_s}>"
  end

  private

  def amount_with_two_decimals
    sprintf('%.2f', @amount)
  end
end
