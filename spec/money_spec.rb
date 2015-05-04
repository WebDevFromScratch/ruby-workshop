require_relative '../money'

describe Money do
  describe 'Kernel#Money' do
    it 'creates a Money instance' do
      expect(Money(10, 'USD')).to be_an_instance_of(Money)
    end
  end

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

    describe '.exchange' do
      it 'should return an Exchange instance' do
        expect(Money.exchange).to be_an_instance_of(Exchange)
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

    describe '#exchange_to' do
      it 'should call the Exchange#convert method' do
        expect_any_instance_of(Exchange).to receive(:convert)

        money.exchange_to('EUR')
      end

      it 'should update currency' do
        money.exchange_to('EUR')

        expect(money.currency).to eq('EUR')
      end
    end
  end
end
