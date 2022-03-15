require 'rails_helper'

RSpec.describe "first_ascents#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/first_ascents/#{first_ascent.id}", payload
  end

  describe 'basic update' do
    let!(:first_ascent) { create(:first_ascent) }

    let(:payload) do
      {
        data: {
          id: first_ascent.id.to_s,
          type: 'first_ascents',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FirstAscentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { first_ascent.reload.attributes }
    end
  end
end
