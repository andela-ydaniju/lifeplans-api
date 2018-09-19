# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.4.4"

gem "active_model_serializers"
gem "bcrypt", "~> 3.1.7"
gem "coveralls", require: false
gem "jwt"
gem "rack-cors"
gem "rails", "~> 5.2"
gem "simple_command"

group :development, :test do
  gem "annotate"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails", "~> 3.0"
  gem "spring"
  gem "sqlite3"
end

group :production do
  gem "pg"
  gem "puma"
  gem "rails_12factor"
end
