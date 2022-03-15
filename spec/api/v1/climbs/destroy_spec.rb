require "rails_helper"

RSpec.describe "climbs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/climbs/#{climb.id}"
  end

  describe "basic destroy" do
    let!(:climb) { create(:climb) }

    it "updates the resource" do
      expect(ClimbResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Climb.count }.by(-1)
      expect { climb.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
