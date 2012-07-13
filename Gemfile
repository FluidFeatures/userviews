source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'jquery-rails'

if ENV["FF_DEV"] and File.directory? '../fluidfeatures-rails'
  gem 'fluidfeatures-rails', :path => '../fluidfeatures-rails'
else
  gem 'fluidfeatures-rails', :git => 'git://github.com/BigFastSite/fluidfeatures-rails.git'
end

group :development do
    gem 'debugger'
end
