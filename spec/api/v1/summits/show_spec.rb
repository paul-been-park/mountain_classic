require "rails_helper"

RSpec.describe "summits#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/summits/#{summit.id}", params: params
  end

  describe "basic fetch" do
    let!(:summit) { create(:summit) }

    it "works" do
      expect(SummitResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("summits")
      expect(d.id).to eq(summit.id)
    end
  end
end
