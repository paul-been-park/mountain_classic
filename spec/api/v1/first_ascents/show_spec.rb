require "rails_helper"

RSpec.describe "first_ascents#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/first_ascents/#{first_ascent.id}", params: params
  end

  describe "basic fetch" do
    let!(:first_ascent) { create(:first_ascent) }

    it "works" do
      expect(FirstAscentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("first_ascents")
      expect(d.id).to eq(first_ascent.id)
    end
  end
end
