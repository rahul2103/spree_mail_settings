module SpreeMailSettings
  class Configuration < ::Spree::Preferences::Configuration
    MAIL_AUTH = %w(None plain login cram_md5).freeze
    SECURE_CONNECTION_TYPES = %w(None SSL TLS).freeze

    def override_actionmailer_config
      raise 'override_actionmailer_config has been removed. ' \
              'actionmailer\'s config is always overwridden when spree_mail_settings is included'
    end

    alias_method :override_actionmailer_config=, :override_actionmailer_config
  end
end
