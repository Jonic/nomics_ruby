# frozen_string_literal: true

RSpec.describe(NomicsRuby::Ticker) do
  subject(:ticker) { described_class.new(options) }

  let(:options) { { ids: ids.join(',') } }
  let(:ids) { %w[BTC ETH] }

  describe('.call', vcr: true) do
    subject(:response) { ticker.call }

    it('returns a collection of the correct length') { expect(response.length).to eq(ids.length) }

    it('returns data for the requested currency IDs') do
      ids.each_with_index { |id, index| expect(response[index]['id']).to eq(id) }
    end
  end
end
