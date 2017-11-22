require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rainbow/ext/string' unless String.respond_to?(:color)
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i(spec rubocop)
