# frozen_string_literal: true

require_relative './request'

module NomicsRuby
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
