require "rails_helper"

RSpec.describe "Update item", type: :request do
  let(:user) do
    create(:user)
  end
  it "updates the paramenters of an item" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    item = create(:item)

    put "/bucketlists/#{bucketlist.id}/items/#{item.id}",
        { description: Faker::Lorem.sentence },
        headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
  end

  it "does not update if the paramenters are incorrect" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    item = create(:item)

    put "/bucketlists/#{bucketlist.id}/items/#{item.id}",
        { description: nil },
        headers

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 422
  end
end
