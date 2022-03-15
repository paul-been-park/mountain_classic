require "rails_helper"

RSpec.describe "legends#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/legends/#{legend.id}"
  end

  describe "basic destroy" do
    let!(:legend) { create(:legend) }

    it "updates the resource" do
      expect(LegendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Legend.count }.by(-1)
      expect { legend.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
