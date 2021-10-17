# frozen_string_literal: true

require 'thor'
require_relative './request'

module NomicsRuby
  class CLI < Thor
    desc 'currencies NAME', 'Get currenices for a ticker or something'
    method_option :ids, aliases: '-n', required: true
    def currencies
      request.get('currencies', **options)
    end

    private

    def request
      @request ||= NomicsRuby::Request.new
    end
  end
end
