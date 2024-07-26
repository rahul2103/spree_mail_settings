module SpreeMailSetting
  module Spree
    module BaseMailerDecorator
      def self.prepended(base)
        base.before_action :ensure_default_action_mailer_url_host
        base.after_action :set_delivery_options
      end

      def current_store
        @current_store ||= @order&.store.presence || @store.presence || Spree::Dependencies.current_store_finder.constantize.new.execute
      end

      private

      def set_delivery_options
        settings = @current_store.mail_setting
        mail.perform_deliveries = (settings.enable_mail_delivery)
        mail.from = @current_store.mail_from_address
        mail.delivery_method.settings.merge!(user_credentials).merge!(basic_settings) if mail.perform_deliveries
      end

      def ensure_default_action_mailer_url_host(store_url = nil)
        ActionMailer::Base.default_url_options ||= {}
        ActionMailer::Base.default_url_options[:protocol] = 'https'
        ActionMailer::Base.default_url_options[:host] ||= store_url
      end

      def user_credentials
        {
          user_name: @current_store.mail_setting.smtp_username,
          password: @current_store.mail_setting.smtp_password,
        }
      end

      def basic_settings
        { 
        address: @current_store.mail_setting.mail_host,
        domain: @current_store.mail_setting.mail_domain,
        port: @current_store.mail_setting.mail_port,
        authentication: @current_store.mail_setting.mail_auth_type,
        secure_connection_type: @current_store.mail_setting.secure_connection_type
      }
      end
    end
  end
end

Spree::BaseMailer.prepend SpreeMailSetting::Spree::BaseMailerDecorator
