lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heroku-one-off/version'

Gem::Specification.new do |spec|
  spec.name          = 'heroku-one-off'
  spec.version       = HerokuOneOff::VERSION
  spec.authors       = ['John Allen']
  spec.email         = ['john.allen@technekes.com']

  spec.summary       = 'Use a Heroku One Off Dyno to perform a tasks'
  spec.description   = <<~DESC
    Take advantage of
    [Heroku One Off Dynos](https://devcenter.heroku.com/articles/one-off-dynos)
    to run tasks, for example on a larger dyno.
  DESC

  spec.homepage      = 'https://github.com/technekes/heroku-on-off'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard', '~> 2'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'guard-rubocop', '~> 1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'rubocop', '0.51'
  spec.add_development_dependency 'simplecov', '~> 0.15'
  spec.add_development_dependency 'webmock', '~> 3.1'
end
