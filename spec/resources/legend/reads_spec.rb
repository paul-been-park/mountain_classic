require "rails_helper"

RSpec.describe LegendResource, type: :resource do
  describe "serialization" do
    let!(:legend) { create(:legend) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(legend.id)
      expect(data.jsonapi_type).to eq("legends")
    end
  end

  describe "filtering" do
    let!(:legend1) { create(:legend) }
    let!(:legend2) { create(:legend) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: legend2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([legend2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:legend1) { create(:legend) }
      let!(:legend2) { create(:legend) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      legend1.id,
                                      legend2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      legend2.id,
                                      legend1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
