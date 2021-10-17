# frozen_string_literal: true

require_relative './request'

module NomicsRuby
  # Get ticker information for one or more currencies.
  #
  # @see https://nomics.com/docs/#operation/getCurrenciesTicker
  #
  # @param options [Hash] Any valid key pair values as documented in the Nomics API
  #
  # @example
  #   NomicsRuby::Ticker.new(ids: 'BTC,ETH').call
  # @return [Hash] The ticker data returned by the Nomics API
  #
  class Ticker
    attr_reader(:options)

    def initialize(options)
      @options = options
    end

    def call
      NomicsRuby::Request.new.get('currencies/ticker', **options)
    end
  end
end
