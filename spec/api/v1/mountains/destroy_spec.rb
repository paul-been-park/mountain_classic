require 'rails_helper'

RSpec.describe "mountains#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/mountains/#{mountain.id}"
  end

  describe 'basic destroy' do
    let!(:mountain) { create(:mountain) }

    it 'updates the resource' do
      expect(MountainResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Mountain.count }.by(-1)
      expect { mountain.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
