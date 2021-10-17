# frozen_string_literal: true

RSpec.describe(NomicsRuby::Request) do
  subject(:request) { described_class.new }

  describe('.get', vcr: true) do
    subject(:response) { request.get(endpoint, query_params) }

    let(:endpoint) { 'currencies/ticker' }
    let(:query_params) { { ids: 'BTC,ETH,XRP' } }

    it('returns a Ruby Hash') { expect(response).to be_an(Array) }
  end
end
