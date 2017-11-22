module HerokuOneOff
  class Runner
    BASE_URL = 'https://api.heroku.com'.freeze

    attr_reader :command, :dyno_size, :time_to_live

    def initialize(
      command,
      dyno_size: HerokuOneOff::Config.default_dyno_size,
      time_to_live: HerokuOneOff::Config.default_time_to_live
    )
      @command = command
      @dyno_size = dyno_size
      @time_to_live = time_to_live
    end

    def call
      HerokuOneOff::HTTP.new(url, body).post
    end

    def app_name
      @app_name ||= HerokuOneOff::Config.app_name_template.call
    end

    def url
      "#{BASE_URL}/apps/#{app_name}/dynos"
    end

    def body
      {
        attach: false,
        command: command,
        size: dyno_size,
        time_to_live: time_to_live
      }
    end
  end
end
