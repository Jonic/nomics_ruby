# frozen_string_literal: true

RSpec.describe(NomicsRuby::Convert) do
  subject(:convert) { described_class.new(options) }

  let(:options) { { from: from, to: to } }
  let(:from) { 'BTC' }
  let(:to) { 'ETH' }

  describe('.call', vcr: true) do
    subject(:response) { convert.call }

    shared_examples('it returns the correct conversion data') do
      it('returns the currency ID') { expect(response['id']).to eq(from) }
      it('returns the currency price in the target currency') { expect(response).to have_key('price') }
    end

    include_examples('it returns the correct conversion data')

    context('with fiat currency') do
      let(:to) { 'GBP' }

      include_examples('it returns the correct conversion data')
    end
  end
end
