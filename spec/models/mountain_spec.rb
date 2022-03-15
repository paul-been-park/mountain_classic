require "rails_helper"

RSpec.describe Mountain, type: :model do
  describe "Direct Associations" do
    it { should have_many(:climbs) }

    it { should belong_to(:region) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
