source 'https://rubygems.org'

gem 'rails', '~> 3.2.8'

gem 'jquery-rails'

if ENV["FF_DEV"] and File.directory? '../fluidfeatures-rails'
  # Use this if your tweaking the fluidfeatures-rails
  # (Not recommended. We use this for development of the gem)
  gem 'fluidfeatures-rails', :path => '../fluidfeatures-rails'
else
  # This is all you need 
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

