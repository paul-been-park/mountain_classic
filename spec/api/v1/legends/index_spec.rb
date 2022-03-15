require 'rails_helper'

RSpec.describe "legends#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/legends", params: params
  end

  describe 'basic fetch' do
    let!(:legend1) { create(:legend) }
    let!(:legend2) { create(:legend) }

    it 'works' do
      expect(LegendResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['legends'])
      expect(d.map(&:id)).to match_array([legend1.id, legend2.id])
    end
  end
end
