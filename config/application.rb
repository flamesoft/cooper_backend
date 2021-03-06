require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsCooper
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    #This will allow GET, POST, PUT and DELETE requests from any origin on any resource.
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        # resource '*', headers: :any, methods: [:get, :put, :delete, :post]
        resource '*', headers: :any, methods: [:get, :post, :delete, :put, :options, :head], expose: %w(access-token expiry token-type uid client), max_age: 0
      end
    end

    # Disable generation of helpers, javascripts, css, and view specs
    config.generators do |generate|
     generate.helper false
     generate.assets false
     generate.view_specs false
    end
  end
end
