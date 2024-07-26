module Spree
  module Admin
    class MailSettingsController < BaseController
      def update
        params[:smtp_password] = nil if params[:smtp_username].blank?

        current_store.mail_setting.update(mail_setting_params)

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:mail_setting))
        redirect_to edit_admin_mail_setting_path
      end

      def edit
        unless @mail_setting = current_store.mail_setting
          @mail_setting = Spree::MailSetting.create!(store_id: current_store.id)
        end
      end

      def testmail
        if TestMailer.test_email(try_spree_current_user.email, current_store).deliver_later
          flash[:success] = Spree.t('mail_methods.testmail.delivery_success')
        else
          flash[:error] = Spree.t('mail_methods.testmail.delivery_error')
        end
      rescue => e
        flash[:error] = Spree.t('mail_methods.testmail.error', e: e)
      ensure
        redirect_to edit_admin_mail_setting_path
      end

      private
      def mail_setting_params
        params.require(:mail_setting).permit(:mails_from, :mail_bcc, :intercept_email, :enable_mail_delivery, :store_id, :mail_host, :mail_domain, :mail_port, :secure_connection_type, :mail_auth_type, :smtp_username, :smtp_password )
      end
    end
  end
end
