RSpec.describe HerokuOneOff::Config do
  describe '.token' do
    let(:token) { 'foo-bar-baz' }

    it 'allows for setting a bearer token' do
      expect { subject.bearer_token = token }.to_not raise_error
    end

    it 'exposes a bearer token' do
      subject.bearer_token = token

      expect(subject.bearer_token).to eq(token)
    end
  end

  describe '.default_dyno_size' do
    let(:size) { 'hobby' }

    it 'allows for setting a default dyno size' do
      expect { subject.default_dyno_size = size }.to_not raise_error
    end

    it 'exposes a default dyno size' do
      subject.default_dyno_size = size

      expect(subject.default_dyno_size).to eq(size)
    end
  end

  describe '.default_time_to_live' do
    let(:ttl) { 3_600 }

    it 'allows for setting a default time to live' do
      expect { subject.default_time_to_live = ttl }.to_not raise_error
    end

    it 'exposes a default time to live' do
      subject.default_time_to_live = ttl

      expect(subject.default_time_to_live).to eq(ttl)
    end
  end

  describe '.app_name_template' do
    let(:template) { -> { 'app-prod-name' } }

    it 'allows for setting an app name template' do
      expect { subject.app_name_template = template }.to_not raise_error
    end

    it 'exposes an app name template' do
      subject.app_name_template = template

      expect(subject.app_name_template).to eq(template)
    end
  end
end
