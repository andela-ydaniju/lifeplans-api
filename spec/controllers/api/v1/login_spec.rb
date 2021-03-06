# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Logging in to an account", type: :request do
  let(:user) do
    create(:user)
  end

  it "logs user in with correct entries" do
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json"
    }
    post "/auth/login", params: {
      username: user.username,
      password: user.password
    }, headers: headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 200
  end

  it "will not log user in with incorrect entries" do
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json"
    }
    post "/auth/login", params: {
      username: user.username,
      password: Faker::Name.name
    }, headers: headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 401
  end
end
