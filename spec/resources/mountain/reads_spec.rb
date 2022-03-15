require "rails_helper"

RSpec.describe MountainResource, type: :resource do
  describe "serialization" do
    let!(:mountain) { create(:mountain) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(mountain.id)
      expect(data.jsonapi_type).to eq("mountains")
    end
  end

  describe "filtering" do
    let!(:mountain1) { create(:mountain) }
    let!(:mountain2) { create(:mountain) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: mountain2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([mountain2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:mountain1) { create(:mountain) }
      let!(:mountain2) { create(:mountain) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      mountain1.id,
                                      mountain2.id,
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
                                      mountain2.id,
                                      mountain1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
