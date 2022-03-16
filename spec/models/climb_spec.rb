require "rails_helper"

RSpec.describe Climb, type: :model do
  describe "Direct Associations" do
    it { should have_many(:to_dos) }

    it { should have_many(:summits) }

    it { should have_many(:comments) }

    it { should have_many(:first_ascents) }

    it { should belong_to(:mountain) }
  end

  describe "InDirect Associations" do
    it { should have_many(:lists) }

    it { should have_many(:users) }

    it { should have_many(:users_that_want_todo) }
  end

  describe "Validations" do
  end
end
