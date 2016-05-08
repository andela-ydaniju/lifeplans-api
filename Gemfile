# frozen_string_literal: true
source "https://rubygems.org"
ruby "2.3.0"
gem "rails", "4.2.4"
gem "rails-api"
gem "jwt"
gem "active_model_serializers"
gem "coveralls", require: false
gem "simple_command"
gem "bcrypt", "~> 3.1.7"

group :development, :test do
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "sqlite3"
  gem "pry"
  gem "annotate"
  gem "spring"
end

group :production do
  gem "pg"
  gem "puma"
  gem "rails_12factor"
end
