require "rails_helper"

RSpec.describe "to_dos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/to_dos", params: params
  end

  describe "basic fetch" do
    let!(:to_do1) { create(:to_do) }
    let!(:to_do2) { create(:to_do) }

    it "works" do
      expect(ToDoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["to_dos"])
      expect(d.map(&:id)).to match_array([to_do1.id, to_do2.id])
    end
  end
end
