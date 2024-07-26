module SpreeMailSettings
  module Spree
    module StoreDecorator
      def self.prepended(base)
        base.has_one :mail_setting, class_name: 'Spree::MailSetting', dependent: :destroy
      end
    end
  end
end

::Spree::Store.prepend SpreeMailSettings::Spree::StoreDecorator
