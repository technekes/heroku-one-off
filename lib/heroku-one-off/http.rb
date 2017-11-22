module HerokuOneOff
  class HTTP
    attr_reader :body, :http, :uri

    def initialize(url, body)
      @uri = URI.parse(url)
      @body = body

      @http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
    end

    def post
      request = Net::HTTP::Post.new(uri, headers)

      request.body = body.to_json

      response = http.request(request)

      raise HerokuOneOff::HTTPError, response.body unless response.code == '201'
    end

    def headers
      {
        'Content-Type': 'application/json',
        Accept: 'application/vnd.heroku+json; version=3',
        Authorization: "Bearer #{HerokuOneOff::Config.bearer_token}"
      }
    end
  end

  class HerokuOneOff::HTTPError < StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end
end
