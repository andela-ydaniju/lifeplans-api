# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Bucketlist creation", type: :request do
  let(:user) do
    create(:user)
  end

  it "does not create bucketlist for unauthenticated user" do
    bucketlist = build(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json"
    }
    post "/bucketlists", {
      name: bucketlist.name
    }, headers

    parsed_bucketlist = JSON.parse(response.body)
    message = "A token is required."
    expect(parsed_bucketlist["message"]).to eq message
  end

  it "does not create bucketlist for unauthenticated user" do
    bucketlist = build(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token wrong_token_for_419s"
    }
    post "/bucketlists", {
      name: bucketlist.name
    }, headers
    parsed_bucketlist = JSON.parse(response.body)
    expect(parsed_bucketlist["message"]).to include "Token invalid"
  end

  it "creates no bucketlist if name not given" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    post "/bucketlists", {
      name: nil
    }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 422
  end

  it "creates bucketlist if all conditions are met" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    post "/bucketlists", {
      name: "Lagrange"
    }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 201
  end
end
