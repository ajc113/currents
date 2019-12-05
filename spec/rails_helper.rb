ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rspec/json_expectations'
require 'capybara/rails'
require 'devise'
require 'capybara-bootstrap-datepicker/rspec'
include Warden::Test::Helpers

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
ActiveRecord::Migration.maintain_test_schema!

FakeStripeRunner.boot

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation,
                                except: %w(ar_internal_metadata)
                              )
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!

  # config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL
  Capybara.javascript_driver = :webkit
  Capybara.default_max_wait_time = 10
  Capybara::Webkit.configure do |config|
    config.allow_unknown_urls
  end
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.extend ControllerMacros, :type => :controller
  config.include AdminSessionHelper, :type => :feature
end
