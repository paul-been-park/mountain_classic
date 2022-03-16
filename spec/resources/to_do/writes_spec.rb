require "rails_helper"

RSpec.describe ToDoResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "to_dos",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ToDoResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ToDo.count }.by(1)
    end
  end

  describe "updating" do
    let!(:to_do) { create(:to_do) }

    let(:payload) do
      {
        data: {
          id: to_do.id.to_s,
          type: "to_dos",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ToDoResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { to_do.reload.updated_at }
      # .and change { to_do.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:to_do) { create(:to_do) }

    let(:instance) do
      ToDoResource.find(id: to_do.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ToDo.count }.by(-1)
    end
  end
end
