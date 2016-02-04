require "rails_helper"

RSpec.describe "Show single bucketlist", type: :request do
  it "show a single bucketlist" do
    bucketlist = create(:bucketlist)
    get "/bucketlists/#{bucketlist.id}"
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
  end

  it "show a single bucketlist" do
    bucketlist = create(:bucketlist)
    get "/bucketlists/#{bucketlist.id + 5}"
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(404)
  end
end
