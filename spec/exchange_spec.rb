require_relative '../exchange'

describe Exchange do
  let(:exchange) { Exchange.new }
  let(:money) { double('Money', amount: 10, currency: 'EUR') }

  describe '#convert' do
    before { stub_const('Exchange::EXCHANGE_RATES', {'EUR_USD' => 1.3}) }

    it 'returns a correct value' do
      expect(exchange.convert(money, 'USD')).to eq(13)
    end
  end
end
