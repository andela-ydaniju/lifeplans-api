require "rails_helper"

RSpec.describe "The deletion of buckelist", type: :request do
  it "destroys selected bucketlist if available" do
    bucketlist = create(:bucketlist)
    delete "/bucketlists/#{bucketlist.id}"

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 200
  end

  it "does not destroy unavailable bucketlist" do
    bucketlist = create(:bucketlist)
    delete "/bucketlists/#{bucketlist.id + 1}"

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end

  it "makes bucketlist become unavailable" do
    bucketlist = create(:bucketlist)
    delete "/bucketlists/#{bucketlist.id}"
    get "/bucketlists/#{bucketlist.id}"

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status 404
  end
end
