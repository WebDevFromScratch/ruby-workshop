module Kernel
  def Money(amount, currency)
    Money.new(amount, currency)
  end
end

class Money
  include Comparable

  def initialize(amount, currency)
    @amount = amount.to_f
    @currency = currency.to_s
  end

  attr_accessor :amount, :currency

  def <=>(anOther)
    exchange_to('USD').amount <=> anOther.exchange_to('USD').amount
  end

  [:from_usd, :from_eur, :from_gbp].each do |method_name|
    define_singleton_method method_name do |amount|
      self.new(amount, method_name.to_s.split('_').last.upcase)
    end
  end

  def method_missing(name)
    name = name.to_s
    if correct_conversion_method?(name)
      self.exchange_to(name.split('_').last.upcase)
    else
      raise NoMethodError, "Unknown method: #{name}"
    end
  end

  def respond_to?(name)
    if correct_conversion_method?(name.to_s)
      true
    else
      super
    end
  end

  def self.exchange
    Exchange.new
  end

  def exchange_to(currency)
    self.amount = self.class.exchange.convert(self, currency)
    self.currency = currency
    self
  end

  def to_s
    "#{amount_with_two_decimals} #{currency}"
  end

  def inspect
    "#<Money #{self.to_s}>"
  end

  private

  def amount_with_two_decimals
    sprintf('%.2f', amount)
  end

  def correct_conversion_method?(name)
    name.split('_').count == 2 && name.split('_').first == 'to' && CURRENCIES.include?(name.split('_').last.upcase)
  end
end
