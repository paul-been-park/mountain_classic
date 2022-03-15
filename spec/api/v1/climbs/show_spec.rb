require "rails_helper"

RSpec.describe "climbs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/climbs/#{climb.id}", params: params
  end

  describe "basic fetch" do
    let!(:climb) { create(:climb) }

    it "works" do
      expect(ClimbResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("climbs")
      expect(d.id).to eq(climb.id)
    end
  end
end
