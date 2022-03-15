require "rails_helper"

RSpec.describe "mountains#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/mountains", params: params
  end

  describe "basic fetch" do
    let!(:mountain1) { create(:mountain) }
    let!(:mountain2) { create(:mountain) }

    it "works" do
      expect(MountainResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["mountains"])
      expect(d.map(&:id)).to match_array([mountain1.id, mountain2.id])
    end
  end
end
