source 'https://rubygems.org'

gem 'rails', '~> 3.2.11'

gem 'jquery-rails'

if ENV["FF_DEV"] and File.directory? '../fluidfeatures-ruby' and File.directory? '../fluidfeatures-rails'
  # (used this for development of the fluidfeatures gems)
  gem 'fluidfeatures',       :path => '../fluidfeatures-ruby'
  gem 'fluidfeatures-rails', :path => '../fluidfeatures-rails'
else
  # This is all you need 
  gem 'fluidfeatures-rails', '~> 0.6.1'
end

group :development do
  gem 'debugger', :platforms => :ruby
  gem 'pry',      :platforms => :jruby
end

# JRuby Rails requires this for active_support/message_encryptor.rb
gem 'jruby-openssl',      :platforms => :jruby
# JRuby requires this
gem 'bouncy-castle-java', :platforms => :jruby

