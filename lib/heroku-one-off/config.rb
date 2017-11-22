module HerokuOneOff
  module Config
    class << self
      attr_accessor(
        :app_name_template,
        :bearer_token
      )

      attr_writer(
        :default_dyno_size,
        :default_time_to_live
      )
    end

    module_function

    def default_dyno_size
      @default_dyno_size ||= 'hobby'
    end

    def default_time_to_live
      @default_time_to_live ||= 1_800
    end
  end
end
