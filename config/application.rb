require File.expand_path('../boot', __FILE__)

# require rails without activerecord
require "action_controller/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Userviews
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app)
    config.cache_classes = false
  end
end

FluidFeatures::Rails.initializer

