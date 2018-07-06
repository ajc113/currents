require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'carrierwave/orm/activerecord'
module Currents
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job


    require 'csv'

    if Rails.env.production?
      Raven.configure do |config|
        config.dsn = 'https://bb708a31d3cf4207b8fba0858dd0aed7:3521b84ea8364a4185c28181e73296ae@sentry.io/284690'

      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.

  end
end
