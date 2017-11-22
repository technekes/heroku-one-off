RSpec.describe HerokuOneOff::Runner do
  describe '#app_name' do
    let(:app_name) { 'some-app-name' }

    it 'creates an app name using the template' do
      HerokuOneOff.config.app_name_template = -> { app_name }

      runner = described_class.new('cmd')

      expect(runner.app_name).to eq(app_name)
    end

    it 'can include dynamic content' do
      HerokuOneOff.config.app_name_template = lambda do
        "foo-#{ENV['RACK_ENV']}-bar"
      end

      %w(stage prod).each do |env|
        ENV['RACK_ENV'] = env

        runner = described_class.new('cmd')

        expect(runner.app_name).to eq("foo-#{env}-bar")
      end
    end
  end

  describe '#url' do
    let(:runner) { described_class.new('cmd') }

    it 'composes a url based on the app name' do
      HerokuOneOff.config.app_name_template = -> { 'some-app-name' }

      expect(runner.url).to include("/apps/#{runner.app_name}/dynos")
    end
  end

  describe '#body' do
    let(:command) { 'rake -T' }
    let(:runner) { described_class.new(command) }

    it 'passes the command via the body' do
      expect(runner.body[:command]).to eq(command)
    end
  end
end
