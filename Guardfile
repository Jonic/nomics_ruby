guard(:rspec, cmd: 'bin/rspec') do
  require 'guard/rspec/dsl'

  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  spec_dir = rspec.spec_dir
  watch(rspec.spec_helper) { spec_dir }
  watch(rspec.spec_support) { spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end
