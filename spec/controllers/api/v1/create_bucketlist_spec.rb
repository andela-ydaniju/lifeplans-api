require "rails_helper"

RSpec.describe "Bucketlist creation", type: :request do
  let(:user) do
    create(:user)
  end

  it "does not create bucketlist for unauthenticated user" do
    bucketlist = build(:bucketlist)

    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json"
    }
    post "/bucketlists", {
      title: bucketlist.title,
    }, headers
    json_parsed = JSON.parse(response.body)
    expect(json_parsed["message"]).to include "Token required"
  end

  it "creates no bucketlist if title not given" do
    signin_helper(user.username, user.password)
    token = token_helper(user.username, user.password)
    headers = {
      "ACCEPT" => "application/json",
      "HTTP_ACCEPT" => "application/json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    post "/bucketlists", {
      title: nil,
    }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(422)
  end
end
