require "rails_helper"

RSpec.describe "Item creation", type: :request do
  let(:user) do
    create(:user)
  end
  it "creates new item for valid user" do
    signin_helper(user.username, user.password)
    token = token_helper(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    item = build(:item)

    post "/bucketlists/#{bucketlist.id}/items",
         { description: item.description },
         headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
  end

  it "creates new item for valid user" do
    signin_helper(user.username, user.password)
    token = token_helper(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    post "/bucketlists/#{bucketlist.id}/items",
         { description: nil },
         headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 422
  end
end
