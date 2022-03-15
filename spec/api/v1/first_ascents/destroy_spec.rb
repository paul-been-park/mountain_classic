require 'rails_helper'

RSpec.describe "first_ascents#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/first_ascents/#{first_ascent.id}"
  end

  describe 'basic destroy' do
    let!(:first_ascent) { create(:first_ascent) }

    it 'updates the resource' do
      expect(FirstAscentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { FirstAscent.count }.by(-1)
      expect { first_ascent.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
