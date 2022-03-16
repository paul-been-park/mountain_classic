require "rails_helper"

RSpec.describe SummitResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "summits",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SummitResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Summit.count }.by(1)
    end
  end

  describe "updating" do
    let!(:summit) { create(:summit) }

    let(:payload) do
      {
        data: {
          id: summit.id.to_s,
          type: "summits",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SummitResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { summit.reload.updated_at }
      # .and change { summit.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:summit) { create(:summit) }

    let(:instance) do
      SummitResource.find(id: summit.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Summit.count }.by(-1)
    end
  end
end
