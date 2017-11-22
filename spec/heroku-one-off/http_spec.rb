RSpec.describe HerokuOneOff::HTTP do
  describe '#call' do
    it 'makes a request to the Heroku Dyno API' do
      HerokuOneOff.config.app_name_template = -> { 'some-app-name' }
      runner = HerokuOneOff::Runner.new('cmd')
      stub = stub_request(:post, runner.url).to_return(status: 201)

      described_class.new(runner.url, runner.body).post

      expect(stub).to have_been_requested
    end

    it 'raises an error if the request is invalid' do
      HerokuOneOff.config.app_name_template = -> { 'some-app-name' }
      runner = HerokuOneOff::Runner.new('cmd')
      stub_request(:post, runner.url).to_return(status: '401')

      expect do
        described_class.new(runner.url, runner.body).post
      end.to raise_error(HerokuOneOff::HTTPError)
    end
  end

  describe '#headers' do
    let(:token)  { 'foo-bar-baz' }
    let(:http) { described_class.new('url', 'body') }

    it 'includes the bearer token in headers' do
      HerokuOneOff.config.bearer_token = token

      expect(http.headers[:Authorization]).to eq("Bearer #{token}")
    end
  end
end
