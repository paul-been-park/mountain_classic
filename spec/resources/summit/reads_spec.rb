require "rails_helper"

RSpec.describe SummitResource, type: :resource do
  describe "serialization" do
    let!(:summit) { create(:summit) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(summit.id)
      expect(data.jsonapi_type).to eq("summits")
    end
  end

  describe "filtering" do
    let!(:summit1) { create(:summit) }
    let!(:summit2) { create(:summit) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: summit2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([summit2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:summit1) { create(:summit) }
      let!(:summit2) { create(:summit) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      summit1.id,
                                      summit2.id,
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
                                      summit2.id,
                                      summit1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
