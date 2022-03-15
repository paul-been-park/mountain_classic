require "rails_helper"

RSpec.describe FirstAscent, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:legend) }

    it { should belong_to(:climb) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
