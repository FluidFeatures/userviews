source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'jquery-rails'

if ENV["FF_DEV"] and File.directory? '../fluidfeatures-rails'
  gem 'fluidfeatures-rails', :path => '../fluidfeatures-rails'
else
  gem 'fluidfeatures-rails'
end

group :development do
  gem 'debugger', :platforms => :ruby
  gem 'pry',      :platforms => :jruby
end

# JRuby Rails requires this for active_support/message_encryptor.rb
gem 'jruby-openssl',      :platforms => :jruby
# JRuby requires this
gem 'bouncy-castle-java', :platforms => :jruby

