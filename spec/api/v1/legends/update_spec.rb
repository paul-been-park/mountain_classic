require "rails_helper"

RSpec.describe "legends#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/legends/#{legend.id}", payload
  end

  describe "basic update" do
    let!(:legend) { create(:legend) }

    let(:payload) do
      {
        data: {
          id: legend.id.to_s,
          type: "legends",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(LegendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { legend.reload.attributes }
    end
  end
end
