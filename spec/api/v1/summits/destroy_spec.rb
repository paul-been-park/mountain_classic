require "rails_helper"

RSpec.describe "summits#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/summits/#{summit.id}"
  end

  describe "basic destroy" do
    let!(:summit) { create(:summit) }

    it "updates the resource" do
      expect(SummitResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Summit.count }.by(-1)
      expect { summit.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
