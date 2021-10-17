# frozen_string_literal: true

module NomicsRuby
  # Convert cryptocurrency to fiat or other cryptocurrency
  #
  # @see https://nomics.com/docs/#operation/getCurrencies
  #
  # The "to" conversion target currency may be any valid Fiat or Cryptocurrency ID.
  #
  # @example NomicsRuby::Convert.new(from: 'BTC', to: 'ETH')
  # @example NomicsRuby::Convert.new(from: 'BTC', to: 'EUR')
  # @example NomicsRuby::Convert.new(from: 'ETH', to: 'GBP')
  #
  # @return [Hash] The base currency ID, and its price in the conversion target currency.
  class Convert
    attr_reader(:from, :to)

    def initialize(options)
      @from = options[:from]
      @to = options[:to]
    end

    def call
      NomicsRuby::Currencies.new(ids: from, convert: to, fields: 'id,price').call[0]
    end
  end
end
