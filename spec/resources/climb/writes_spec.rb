require "rails_helper"

RSpec.describe ClimbResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "climbs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ClimbResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Climb.count }.by(1)
    end
  end

  describe "updating" do
    let!(:climb) { create(:climb) }

    let(:payload) do
      {
        data: {
          id: climb.id.to_s,
          type: "climbs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ClimbResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { climb.reload.updated_at }
      # .and change { climb.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:climb) { create(:climb) }

    let(:instance) do
      ClimbResource.find(id: climb.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Climb.count }.by(-1)
    end
  end
end
