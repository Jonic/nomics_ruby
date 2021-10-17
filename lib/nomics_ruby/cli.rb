# frozen_string_literal: true

require 'thor'

module NomicsRuby
  class CLI < Thor
    desc 'portray NAME', 'Get currenices for a ticker or something'
    def currencies(name)
      puts name
    end
  end
end
