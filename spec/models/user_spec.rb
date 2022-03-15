require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:legends) }

    it { should have_many(:received) }

    it { should have_many(:sent) }

    it { should have_many(:ticks) }

    it { should have_many(:interactions) }
  end

  describe "InDirect Associations" do
    it { should have_many(:climb_interactions) }
  end

  describe "Validations" do
  end
end
