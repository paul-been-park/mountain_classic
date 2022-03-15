require "rails_helper"

RSpec.describe Legend, type: :model do
  describe "Direct Associations" do
    it { should have_many(:first_ascents) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
