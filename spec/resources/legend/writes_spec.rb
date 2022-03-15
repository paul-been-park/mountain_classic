require "rails_helper"

RSpec.describe LegendResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "legends",
          attributes: {},
        },
      }
    end

    let(:instance) do
      LegendResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Legend.count }.by(1)
    end
  end

  describe "updating" do
    let!(:legend) { create(:legend) }

    let(:payload) do
      {
        data: {
          id: legend.id.to_s,
          type: "legends",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      LegendResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { legend.reload.updated_at }
      # .and change { legend.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:legend) { create(:legend) }

    let(:instance) do
      LegendResource.find(id: legend.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Legend.count }.by(-1)
    end
  end
end
