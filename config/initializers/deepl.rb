DeepL.configure do |config|
  config.auth_key = ENV.fetch("DEEPL_AUTH_KEY", "dummy key")
  config.host = "https://api-free.deepl.com"
end
