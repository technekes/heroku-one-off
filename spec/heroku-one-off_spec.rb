RSpec.describe HerokuOneOff do
  let(:token) { 'foo-bar-baz' }

  it 'has a version number' do
    expect(HerokuOneOff::VERSION).not_to be nil
  end

  it 'exposes configuration' do
    subject.configure do |config|
      config.bearer_token = token
    end

    expect(subject.config.bearer_token).to eq(token)
  end
end
