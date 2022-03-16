require "rails_helper"

RSpec.describe "summits#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/summits/#{summit.id}", payload
  end

  describe "basic update" do
    let!(:summit) { create(:summit) }

    let(:payload) do
      {
        data: {
          id: summit.id.to_s,
          type: "summits",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SummitResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { summit.reload.attributes }
    end
  end
end
