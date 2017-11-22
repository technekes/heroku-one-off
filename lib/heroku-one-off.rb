require 'net/http'
require 'json'
require 'uri'

require 'heroku-one-off/version'

require 'heroku-one-off/config'
require 'heroku-one-off/http'
require 'heroku-one-off/runner'

module HerokuOneOff
  module_function

  def configure
    yield Config
  end

  def config
    Config
  end
end
