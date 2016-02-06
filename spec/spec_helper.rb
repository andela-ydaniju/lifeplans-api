require "factory_girl_rails"
require "json"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
end

def signin_helper(username = "man", pass = "mamamamama")
  post "/auth/login", { username: username, password: pass },
       { HTTP_ACCEPT: "application/vnd.apibucket.v1+json" }
end

def token_helper(username = "man", pass = "mamamamama")
  signin_helper(username, pass)
  parsed_response = JSON.parse response.body

  parsed_response["token"]
end
