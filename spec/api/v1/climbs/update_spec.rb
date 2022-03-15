require "rails_helper"

RSpec.describe "climbs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/climbs/#{climb.id}", payload
  end

  describe "basic update" do
    let!(:climb) { create(:climb) }

    let(:payload) do
      {
        data: {
          id: climb.id.to_s,
          type: "climbs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ClimbResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { climb.reload.attributes }
    end
  end
end
