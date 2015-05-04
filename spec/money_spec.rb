require_relative '../money'

describe Money do
  let(:money) { Money.new(10, 'USD') }

  describe '#to_s' do
    it 'should return a properly formatted string' do
      expect(money.to_s).to eq('10.00 USD')
    end
  end

  describe '#inspect' do
    it 'should return a properly formatted string' do
      expect(money.inspect).to eq('#<Money 10.00 USD>')
    end
  end
end
