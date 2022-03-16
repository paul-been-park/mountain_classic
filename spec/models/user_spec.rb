require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:to_dos) }

    it { should have_many(:summits) }

    it { should have_many(:legends) }

    it { should have_many(:received) }

    it { should have_many(:sent) }

    it { should have_many(:interactions) }
  end

  describe "InDirect Associations" do
    it { should have_many(:todos) }

    it { should have_many(:climbs) }

    it { should have_many(:climbs_todo) }
  end

  describe "Validations" do
  end
end
