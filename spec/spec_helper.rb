# frozen_string_literal: true

require "factory_bot_rails"
require "json"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryBot::Syntax::Methods
end

def signin_helper(username, password)
  post "/auth/login",
       params: { username: username, password: password },
       headers: { HTTP_ACCEPT: "application/vnd.lifeplans-api.v1+json" }
end

def token_builder(username, password)
  signin_helper(username, password)
  parsed_response = JSON.parse response.body

  parsed_response["token"]
end
