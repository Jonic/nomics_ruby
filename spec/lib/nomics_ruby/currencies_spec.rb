# frozen_string_literal: true

RSpec.describe(NomicsRuby::Currencies) do
  subject(:currencies) { described_class.new(options) }

  let(:options) { { fields: fields.join(','), ids: ids.join(',') } }
  let(:fields) { %w[circulating_supply max_supply name symbol price] }
  let(:ids) { %w[BTC] }

  describe('.call', vcr: true) do
    subject(:response) { currencies.call }

    it('returns a collection of the correct length') { expect(response.length).to eq(ids.length) }

    it('returns data for the requested currency IDs') { fields.each { |field| expect(response[0]).to have_key(field) } }
  end
end
