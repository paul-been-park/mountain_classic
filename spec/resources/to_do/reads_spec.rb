require "rails_helper"

RSpec.describe ToDoResource, type: :resource do
  describe "serialization" do
    let!(:to_do) { create(:to_do) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(to_do.id)
      expect(data.jsonapi_type).to eq("to_dos")
    end
  end

  describe "filtering" do
    let!(:to_do1) { create(:to_do) }
    let!(:to_do2) { create(:to_do) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: to_do2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([to_do2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:to_do1) { create(:to_do) }
      let!(:to_do2) { create(:to_do) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      to_do1.id,
                                      to_do2.id,
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
                                      to_do2.id,
                                      to_do1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
