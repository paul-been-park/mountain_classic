require 'rails_helper'

RSpec.describe "legends#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/legends/#{legend.id}", params: params
  end

  describe 'basic fetch' do
    let!(:legend) { create(:legend) }

    it 'works' do
      expect(LegendResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('legends')
      expect(d.id).to eq(legend.id)
    end
  end
end
