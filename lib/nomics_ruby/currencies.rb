# frozen_string_literal: true

require_relative './request'
require_relative './ticker'

module NomicsRuby
  # Get metadata for one or more currencies.
  #
  # @see https://nomics.com/docs/#operation/getCurrencies
  #
  # @param options [Hash] Any valid key pair values as documented in the Nomics API, along with an optional key for
  #   `fields` which, will should contain a list comma-separated keys from the currency metadata.
  #
  # If no `fields` are specified, the returned data will contain all the metadata available for each currency ID.
  #
  # @example
  #   NomicsRuby::Currencies.new(ids: 'BTC,ETH').call
  # @return [Hash] The currencies data returned by the Nomics API, optionally filtered to remove any data that does
  #   not satisfy the requirements defined in the `fields`.
  #
  class Currencies
    attr_reader(:data, :fields)

    def initialize(options)
      @data = NomicsRuby::Ticker.new(**options).call
      @fields = options[:fields].split(',') if options.key?(:fields)
    end

    def call
      return data unless fields

      data.map { |datum| datum.slice(*fields) }
    end
  end
end
