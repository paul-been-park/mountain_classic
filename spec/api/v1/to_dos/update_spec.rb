require "rails_helper"

RSpec.describe "to_dos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/to_dos/#{to_do.id}", payload
  end

  describe "basic update" do
    let!(:to_do) { create(:to_do) }

    let(:payload) do
      {
        data: {
          id: to_do.id.to_s,
          type: "to_dos",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ToDoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { to_do.reload.attributes }
    end
  end
end
