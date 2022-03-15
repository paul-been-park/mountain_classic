require 'rails_helper'

RSpec.describe "mountains#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/mountains/#{mountain.id}", params: params
  end

  describe 'basic fetch' do
    let!(:mountain) { create(:mountain) }

    it 'works' do
      expect(MountainResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('mountains')
      expect(d.id).to eq(mountain.id)
    end
  end
end
