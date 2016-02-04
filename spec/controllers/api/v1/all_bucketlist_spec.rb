require "rails_helper"

RSpec.describe "list all bucketlists", type: :request do
  it "shows a list of all bucketlists" do
    create_list(:bucketlist, 3)
    get "/bucketlists"

    json = JSON.parse(response.body)

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
    expect(json.length).to eq(3)
  end

  it "shows a nothing if list is empty" do
    get "/bucketlists"
    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
