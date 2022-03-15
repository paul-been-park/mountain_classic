require 'rails_helper'

RSpec.describe "first_ascents#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/first_ascents", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'first_ascents',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FirstAscentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { FirstAscent.count }.by(1)
    end
  end
end
