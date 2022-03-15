require 'rails_helper'

RSpec.describe "first_ascents#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/first_ascents", params: params
  end

  describe 'basic fetch' do
    let!(:first_ascent1) { create(:first_ascent) }
    let!(:first_ascent2) { create(:first_ascent) }

    it 'works' do
      expect(FirstAscentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['first_ascents'])
      expect(d.map(&:id)).to match_array([first_ascent1.id, first_ascent2.id])
    end
  end
end
