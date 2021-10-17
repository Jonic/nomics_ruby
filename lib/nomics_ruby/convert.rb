# frozen_string_literal: true

module NomicsRuby
  class Convert
    attr_reader(:from, :to)

    def initialize(options)
      @from = options[:from]
      @to = options[:to]
    end

    def call
      NomicsRuby::Currencies.new(ids: from, convert: to, fields: 'id,price').call
    end
  end
end
