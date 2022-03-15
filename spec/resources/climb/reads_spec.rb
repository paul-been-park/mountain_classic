require 'rails_helper'

RSpec.describe ClimbResource, type: :resource do
  describe 'serialization' do
    let!(:climb) { create(:climb) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(climb.id)
      expect(data.jsonapi_type).to eq('climbs')
    end
  end

  describe 'filtering' do
    let!(:climb1) { create(:climb) }
    let!(:climb2) { create(:climb) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: climb2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([climb2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:climb1) { create(:climb) }
      let!(:climb2) { create(:climb) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            climb1.id,
            climb2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            climb2.id,
            climb1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
