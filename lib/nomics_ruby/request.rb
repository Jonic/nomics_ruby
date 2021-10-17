# frozen_string_literal: true

# export NOMICS_API_KEY='04852ded-5407-4662-8420-3be14cf4b03b'

require 'dotenv/load'
require 'json'
require 'net/http'
require 'uri'

module NomicsRuby
  class Request
    API_URL = 'https://api.nomics.com/v1/'

    attr_reader(:api_key, :endpoint, :params)

    def initialize
      @api_key = ENV['NOMICS_API_KEY_V1']
    end

    def get(endpoint, **params)
      @endpoint = endpoint
      @params = URI.encode_www_form({}.merge(params, key: api_key))

      puts uri

      JSON.parse(request)
    end

    private

    def path
      [endpoint, params].join('?')
    end

    def request
      Net::HTTP.get(uri)
    end

    def uri
      URI.join(API_URL, path)
    end
  end
end
