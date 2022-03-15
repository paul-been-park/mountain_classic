require 'rails_helper'

RSpec.describe MountainResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'mountains',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MountainResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Mountain.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:mountain) { create(:mountain) }

    let(:payload) do
      {
        data: {
          id: mountain.id.to_s,
          type: 'mountains',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MountainResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { mountain.reload.updated_at }
      # .and change { mountain.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:mountain) { create(:mountain) }

    let(:instance) do
      MountainResource.find(id: mountain.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Mountain.count }.by(-1)
    end
  end
end
