class CreateSpreeMailSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :spree_mail_settings do |t|
      t.string :mails_from, default: 'spree@example.com'
      t.boolean :enable_mail_delivery, default: false
      t.string :mail_bcc, default: 'spree@example.com'
      t.string :intercept_email, default: nil
      t.string :mail_host, default: 'localhost'
      t.string :mail_domain, default: 'localhost'
      t.integer :mail_port, default: 25
      t.string :secure_connection_type, default: ::SpreeMailSettings::Configuration::SECURE_CONNECTION_TYPES[0]
      t.string :mail_auth_type, default: ::SpreeMailSettings::Configuration::MAIL_AUTH[0]
      t.string :smtp_username, default: nil
      t.string :smtp_password, default: nil

      t.references :store, foreign_key: { to_table: :spree_stores }

      t.timestamps
    end
  end
end
