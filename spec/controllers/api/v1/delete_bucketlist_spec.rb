# frozen_string_literal: true

require "rails_helper"

RSpec.describe "The deletion of buckelist", type: :request do
  let(:user) do
    create(:user)
  end

  it "destroys selected bucketlist if available" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    delete "/bucketlists/#{bucketlist.id}", headers: headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
  end

  it "does not destroy unavailable bucketlist" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    delete "/bucketlists/#{bucketlist.id + 1}", headers: headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end

  it "makes bucketlist become unavailable" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    delete "/bucketlists/#{bucketlist.id}", headers: headers

    get "/bucketlists/#{bucketlist.id}", headers: headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
