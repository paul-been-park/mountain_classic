require "rails_helper"

RSpec.describe Region, type: :model do
  describe "Direct Associations" do
    it { should have_many(:mountains) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
