# frozen_string_literal: true

require File.expand_path("boot", __dir__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LifeplansApi
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("lib")
    config.api_only = true
    config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end
