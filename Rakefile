# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'reek/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Reek::Rake::Task.new
RSpec::Core::RakeTask.new(:rspec)
RuboCop::RakeTask.new

task(default: %i[rspec rubocop reek])
