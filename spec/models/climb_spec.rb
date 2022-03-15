require 'rails_helper'

RSpec.describe Climb, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    it { should have_many(:first_ascents) }

    it { should belong_to(:mountain) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
