module SpreeMailSettings
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_mail_settings'

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'spree_mail_settings', before: :load_config_initializers do |_app|
      SpreeMailSettings::Config = ::SpreeMailSettings::Configuration.new
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
