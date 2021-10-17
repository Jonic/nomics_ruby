# Nomics Ruby

This Gem is an example of a Ruby wrapper for the nomics.com cryptocurrency API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nomics_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nomics_ruby

## Usage

This tool can be used as a CLI, or installed in a Ruby/Rails application and called from the application.

In order to use this tool, your must use a [Nomics API key](https://p.nomics.com/cryptocurrency-bitcoin-api/). This can be configured with an Environment Variable in your application's `.env` file, or in your system's bash or zsh config.

You can also directly specify the API key when using the CLI or classes.

### Using as a CLI

    $ nomics --help

Available commands:

- `convert`
- `currencies`
- `ticker`

View usage information for each command:

    $ nomics help [COMMAND]

The output or each command is echoed to the Terminal.

### Using in an application

The same functionality available in the CLI is also available by directly calling the following classes

- `NomicsRuby::Convert.new([options]).get`
- `NomicsRuby::Currencies.new([options]).get`
- `NomicsRuby::Ticker.new([options]).get`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Building for local installation

    $ bin/rake build
    $ gem install pkg/nomics_ruby-0.1.0.gem

When the installation has finished, the CLI commands will be available to your system.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Jonic/nomics_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Jonic/nomics_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NomicsRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Jonic/nomics_ruby/blob/master/CODE_OF_CONDUCT.md).
