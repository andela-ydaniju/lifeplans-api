require "rails_helper"

RSpec.describe "Show single bucketlist", type: :request do
  let(:user) do
    create(:user)
  end

  it "show a single bucketlist" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    get "/bucketlists/#{bucketlist.id}",
        {},
        headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 200
  end

  it "show a single bucketlist" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }
    get "/bucketlists/#{bucketlist.id + 5}",
        {},
        headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 404
  end
end
