require 'rails_helper'

RSpec.describe FirstAscentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'first_ascents',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FirstAscentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FirstAscent.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:first_ascent) { create(:first_ascent) }

    let(:payload) do
      {
        data: {
          id: first_ascent.id.to_s,
          type: 'first_ascents',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FirstAscentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { first_ascent.reload.updated_at }
      # .and change { first_ascent.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:first_ascent) { create(:first_ascent) }

    let(:instance) do
      FirstAscentResource.find(id: first_ascent.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FirstAscent.count }.by(-1)
    end
  end
end
