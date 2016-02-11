require "rails_helper"

RSpec.describe "Delete item", type: :request do
  let(:user) do
    create(:user)
  end

  it "deletes an item" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    item = create(:item)

    delete "/bucketlists/#{bucketlist.id}/items/#{item.id}",
           {},
           headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
  end

  it "does not delete an item inexistent item" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    item = create(:item)

    delete "/bucketlists/#{bucketlist.id}/items/#{item.id + 5}",
           {},
           headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
