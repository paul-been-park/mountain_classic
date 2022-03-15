require "rails_helper"

RSpec.describe "climbs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/climbs", params: params
  end

  describe "basic fetch" do
    let!(:climb1) { create(:climb) }
    let!(:climb2) { create(:climb) }

    it "works" do
      expect(ClimbResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["climbs"])
      expect(d.map(&:id)).to match_array([climb1.id, climb2.id])
    end
  end
end
