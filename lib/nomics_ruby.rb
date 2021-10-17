# frozen_string_literal: true

require_relative './nomics_ruby/convert'
require_relative './nomics_ruby/currencies'
require_relative './nomics_ruby/ticker'
require_relative './nomics_ruby/version'

module NomicsRuby
  class Error < StandardError
  end
end
