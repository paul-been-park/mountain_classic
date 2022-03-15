require 'rails_helper'

RSpec.describe "mountains#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/mountains/#{mountain.id}", payload
  end

  describe 'basic update' do
    let!(:mountain) { create(:mountain) }

    let(:payload) do
      {
        data: {
          id: mountain.id.to_s,
          type: 'mountains',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MountainResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { mountain.reload.attributes }
    end
  end
end
