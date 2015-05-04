require_relative 'exchange'

module Kernel
  def Money(amount, currency)
    Money.new(amount, currency)
  end
end

class Money
  def initialize(amount, currency)
    @amount = amount.to_f
    @currency = currency.to_s
  end

  [:from_usd, :from_eur, :from_gbp].each do |method_name|
    define_singleton_method method_name do |amount|
      self.new(amount, method_name.to_s.split('_').last.upcase)
    end
  end

  def self.exchange
    Exchange.new
  end

  def to_s
    "#{amount_with_two_decimals} #{currency}"
  end

  def inspect
    "#<Money #{self.to_s}>"
  end

  def amount
    @amount
  end

  def currency
    @currency
  end

  private

  def amount_with_two_decimals
    sprintf('%.2f', amount)
  end
end
