# frozen_string_literal: true

require 'byebug'
require 'thor'
require_relative './convert'
require_relative './currencies'
require_relative './ticker'

module NomicsRuby
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    # bin/nomics ticker --ids=BTC,XRP,ETH
    desc('ticker', 'Get ticker information for a list of currency IDs')
    method_option(:ids, required: true)
    def ticker
      puts NomicsRuby::Ticker.new(options).call
    end

    # bin/nomics currencies --ids=BTC,ETH --fields=circulating_supply,max_supply,name,symbol,price
    desc('currencies', 'Get metadata for a list of currency IDs')
    method_option(:ids, required: true)
    method_option(:fields)
    def currencies
      puts NomicsRuby::Currencies.new(options).call
    end

    # bin/nomics convert --from=BTC --to=ETH
    # bin/nomics convert --from=BTC --to=EUR
    # bin/nomics convert --from=ETH --to=GBP
    desc('convert', 'Convert cryptocurrency to fiat or other cryptocurrency')
    method_option(:from, required: true)
    method_option(:to, required: true)
    def convert
      puts NomicsRuby::Convert.new(options).call
    end
  end
end
