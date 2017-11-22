# heroku-one-off

Take advantage of [Heroku One Off Dynos](https://devcenter.heroku.com/articles/one-off-dynos) to run tasks, for example on a larger dyno.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heroku-one-off'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku-one-off

## Usage

### Configuration

```rb
HerokuOneOff.configure do |config|
  config.app_name_template    = -> { "foo-app-#{ENV['RACK_ENV']}" }
  config.bearer_token         = ENV['HEROKU_BEARER_TOKEN']
  config.default_dyno_size    = 'performance-m'  # optional, default: 'hobby'
  config.default_time_to_live = 3_600            # optional, default: 1_800
end
```

### Request a Dyno

```rb
HerokuOneOff::Runer.new('rake -T').call
```

## Development

After checking out the repo, run `docker-compose build` to install dependencies. Then, run `docker-compose rake gem` to run the tests. You can also run `docker-compose console gem` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/technekes/heroku-one-off.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
