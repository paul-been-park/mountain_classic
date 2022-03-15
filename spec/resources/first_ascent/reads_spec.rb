require "rails_helper"

RSpec.describe FirstAscentResource, type: :resource do
  describe "serialization" do
    let!(:first_ascent) { create(:first_ascent) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(first_ascent.id)
      expect(data.jsonapi_type).to eq("first_ascents")
    end
  end

  describe "filtering" do
    let!(:first_ascent1) { create(:first_ascent) }
    let!(:first_ascent2) { create(:first_ascent) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: first_ascent2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([first_ascent2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:first_ascent1) { create(:first_ascent) }
      let!(:first_ascent2) { create(:first_ascent) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      first_ascent1.id,
                                      first_ascent2.id,
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
                                      first_ascent2.id,
                                      first_ascent1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
