require 'bundler/setup'
require 'heroku-one-off'

require 'webmock/rspec'

require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # These settings work together to allow you to limit a spec run
  config.filter_run :focus
  config.filter_run_excluding :disabled
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
