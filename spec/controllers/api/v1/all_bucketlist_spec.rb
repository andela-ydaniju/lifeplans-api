# frozen_string_literal: true
require "rails_helper"

RSpec.describe "list all bucketlists", type: :request do
  let(:user) do
    create(:user)
  end

  it "shows a list of all bucketlists" do
    signin_helper(user.username, user.password)

    create_list(:bucketlist, 3)

    token = token_builder(user.username, user.password)

    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    get "/bucketlists", {},
        headers

    parsed_bucketlist = JSON.parse(response.body)

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
    expect(parsed_bucketlist.length).to eq 3
  end

  it "shows a list of all bucketlists matching a search" do
    signin_helper(user.username, user.password)

    create_list(:bucketlist, 3)

    token = token_builder(user.username, user.password)

    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    post "/bucketlists", {
      name: "Adventure"
    }, headers

    get "/bucketlists", {
      q: "Advent"
    }, headers

    parsed_bucketlist = JSON.parse(response.body)

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
    expect(parsed_bucketlist.last["name"]).to eq "Adventure"
  end

  it "shows nothing if list is empty" do
    signin_helper(user.username, user.password)

    token = token_builder(user.username, user.password)

    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    get "/bucketlists", {},
        headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
