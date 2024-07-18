require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Questioner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Tells rails to handle errors via routes
    config.exceptions_app = self.routes

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # Load all YAML files from the config/locales directory
    #  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

    config.i18n.available_locales = %i[da de en es fr nb pt sv zh]

    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

  
  end
end
