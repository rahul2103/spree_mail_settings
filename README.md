# Spree Mail Settings

## Installation

1. Add this extension to your Gemfile with this line:
  #### Spree 3.0 and Spree 2.x

  ```ruby
  gem 'spree_mail_settings', github: 'rahul2103/spree_mail_settings', branch: 'X-X-stable'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations:
  ```ruby
  bundle exec rails generate spree_mail_settings:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.
