require File.expand_path('../boot', __FILE__)

# require rails without activerecord
require "action_controller/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

require 'fluidfeatures/rails'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Userviews
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    config.autoload_paths += %W(#{config.root}/lib)

    FluidFeatures::Rails.initializer
  end
end
