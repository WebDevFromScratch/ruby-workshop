require_relative '../money'

describe Money do
  describe 'Class methods' do
    describe '.from_usd' do
      let(:money_usd) { Money.from_usd(10) }

      it 'should create an expected Money instance' do
        expect(money_usd).to be_an_instance_of(Money)
        expect(money_usd.currency).to eq('USD')
        expect(money_usd.amount).to eq(10)
      end
    end

    describe '.from_eur' do
      let(:money_eur) { Money.from_eur(10) }

      it 'should create an expected Money instance' do
        expect(money_eur).to be_an_instance_of(Money)
        expect(money_eur.currency).to eq('EUR')
        expect(money_eur.amount).to eq(10)
      end
    end

    describe '.from_gbp' do
      let(:money_gbp) { Money.from_gbp(10) }

      it 'should create an expected Money instance' do
        expect(money_gbp).to be_an_instance_of(Money)
        expect(money_gbp.currency).to eq('GBP')
        expect(money_gbp.amount).to eq(10)
      end
    end
  end

  describe 'Instance methods' do
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
end
