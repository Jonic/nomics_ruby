# frozen_string_literal: true

# export NOMICS_API_KEY='04852ded-5407-4662-8420-3be14cf4b03b'

module NomicsRuby
  class Request
    API_URL = 'https://api.nomics.com/v1/'

    def initialize(api_key: nil)
      @api_key = api_key if api_key.present?
    end

    def call; end

    private

    def api_key
      @api_key ||= ENV['NOMICS_API_KEY_V1']
    end

    def result; end
  end
end
