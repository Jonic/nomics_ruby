# frozen_string_literal: true

require 'byebug'
require 'thor'
require_relative './convert'
require_relative './currencies'
require_relative './ticker'

module NomicsRuby
  # Command Line Interface definition for bin/nomics executable
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc('ticker', 'Get ticker information for one or more currencies')
    long_desc <<-LONGDESC
      Get ticker information for one or more currencies

      > $ bin/nomics ticker --ids=BTC,XRP,ETH
    LONGDESC
    method_option(:ids, desc: 'String: comma-separated currency IDs', required: true, type: :string)
    method_option(:key, desc: 'String: a Nomics API key (optional)', type: :string)
    def ticker
      puts NomicsRuby::Ticker.new(options).call
    end

    desc('currencies', 'Get metadata for one or more currencies, optionally filtered by keys')
    long_desc <<-LONGDESC
      Get metadata for one or more currencies

      > $ bin/nomics currencies --ids=BTC,ETH --fields=circulating_supply,max_supply,name,symbol,price

      Valid field keys: [
        circulating_supply,
        currency,
        first_candle,
        first_order_book,
        first_priced_at,
        first_trade,
        high,
        high_timestamp,
        id,
        logo_url,
        market_cap,
        market_cap_dominance,
        max_supply,
        name,
        num_exchanges,
        num_pairs,
        num_pairs_unmapped,
        price,
        price_date,
        price_timestamp,
        rank,
        rank_delta,
        status,
        symbol,
        transparent_market_cap
      ]

      If no fields are specified, the data returned will contain all of the available meta data for the requested currencies
    LONGDESC
    method_option(:ids, desc: 'String: comma-separated currency IDs', required: true, type: :string)
    method_option(:fields, desc: 'String: comma-separated field keys', type: :string)
    method_option(:key, desc: 'String: a Nomics API key (optional)', type: :string)
    def currencies
      puts NomicsRuby::Currencies.new(options).call
    end

    desc('convert', 'Convert cryptocurrency to fiat or other cryptocurrency')
    long_desc <<-LONGDESC
      Convert cryptocurrency to fiat or other cryptocurrency

      > $ bin/nomics convert --from=BTC --to=ETH\n
      > $ bin/nomics convert --from=BTC --to=EUR\n
      > $ bin/nomics convert --from=ETH --to=GBP

      The conversion target currency may be any valid Fiat or Cryptocurrency ID
    LONGDESC
    method_option(:from, desc: 'String: the base currency ID', required: true, type: :string)
    method_option(:to, desc: 'String: the conversion target currency ID', required: true, type: :string)
    method_option(:key, desc: 'String: a Nomics API key (optional)', type: :string)
    def convert
      puts NomicsRuby::Convert.new(options).call
    end
  end
end
