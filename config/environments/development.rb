Userviews::Application.configure do
  config.threadsafe!
  config.cache_classes = false
  config.active_support.deprecation = :stderr
end
