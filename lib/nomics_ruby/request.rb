# frozen_string_literal: true

require 'dotenv/load'
require 'json'
require 'net/http'
require 'uri'

module NomicsRuby
  # Make a GET request to the Nomics API
  #
  # @see https://nomics.com/docs
  #
  # @example
  #   NomicsRuby::Request.new.get(endpoint, query_params)
  #
  class Request
    API_URL = 'https://api.nomics.com/v1/'

    attr_reader(:api_key, :endpoint, :query_params)

    # Set up the request API key
    def initialize
      @api_key = ENV['NOMICS_API_KEY_V1']
    end

    # Retrieve data from the API
    #
    # @param endpoint [String] the API path for the request
    # @param query_params [Hash] key/value pairs to be passed to the API with the request
    #
    # @return [Hash] the response data returned from the API
    #
    def get(endpoint, **query_params)
      @endpoint = endpoint
      @query_params = URI.encode_www_form({ key: api_key }.merge(query_params))

      JSON.parse(request)
    end

    private

    def path
      [endpoint, query_params].join('?')
    end

    def request
      Net::HTTP.get(uri)
    end

    def uri
      URI.join(API_URL, path)
    end
  end
end
