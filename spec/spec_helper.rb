# frozen_string_literal: true

require 'dead_end'
require 'fuubar'
require 'nomics_ruby'
require 'simplecov' unless ENV['NO_COVERAGE']
require 'vcr'
require 'webmock/rspec'

SimpleCov.start { add_group('Libraries', 'lib') }

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.filter_run_when_matching(:focus)

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
  config.fail_fast = 5
  config.fuubar_output_pending_results = false
  config.order = :random
  config.profile_examples = 10
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Kernel.srand(config.seed)
end

VCR.configure do |config|
  config.configure_rspec_metadata!
  config.hook_into(:webmock)
  config.ignore_hosts('localhost', '127.0.0.1', '0.0.0.0')

  config.cassette_library_dir = 'spec/support/vcr_cassettes'
end

WebMock.disable_net_connect!(allow_localhost: true)
