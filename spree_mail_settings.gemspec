# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_mail_settings/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_mail_settings'
  s.version     = SpreeMailSettings.version
  s.summary     = 'Mail setting functionality extracted from Spree Commerce'
  s.description = s.summary
  s.required_ruby_version = '>= 2.5.7'

  s.author    = 'John Hawthorn'
  s.email     = 'john.hawthorn@gmail.com'
  s.homepage  = 'https://github.com/spree-contrib/spree_mail_settings'
  s.license   = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '>= 4.6.0'
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
end
