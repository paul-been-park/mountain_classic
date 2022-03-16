require "rails_helper"

RSpec.describe "summits#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/summits", params: params
  end

  describe "basic fetch" do
    let!(:summit1) { create(:summit) }
    let!(:summit2) { create(:summit) }

    it "works" do
      expect(SummitResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["summits"])
      expect(d.map(&:id)).to match_array([summit1.id, summit2.id])
    end
  end
end
