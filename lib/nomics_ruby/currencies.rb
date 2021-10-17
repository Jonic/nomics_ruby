# frozen_string_literal: true

require_relative './request'
require_relative './ticker'

module NomicsRuby
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
