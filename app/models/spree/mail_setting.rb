module Spree
  class MailSetting < ActiveRecord::Base
    belongs_to :store
  end
end
