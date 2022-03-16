require "rails_helper"

RSpec.describe "to_dos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/to_dos/#{to_do.id}", params: params
  end

  describe "basic fetch" do
    let!(:to_do) { create(:to_do) }

    it "works" do
      expect(ToDoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("to_dos")
      expect(d.id).to eq(to_do.id)
    end
  end
end
