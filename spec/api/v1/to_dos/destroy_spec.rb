require "rails_helper"

RSpec.describe "to_dos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/to_dos/#{to_do.id}"
  end

  describe "basic destroy" do
    let!(:to_do) { create(:to_do) }

    it "updates the resource" do
      expect(ToDoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ToDo.count }.by(-1)
      expect { to_do.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
