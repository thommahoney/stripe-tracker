require 'rspec'
require './smallest_missing.rb'

RSpec.describe SmallestMissing do
  context "with an unsorted array of integers" do
    let(:ints) { [2, 4, 1] }

    it "should find the smallest number (3)" do
      expect(SmallestMissing.call(ints)).to eq(3)
    end
  end

  context "with all of the numbers" do
    let(:ints) { [1, 2, 3] }

    it "should return four" do
      expect(SmallestMissing.call(ints)).to eq(4)
    end
  end

  context "with some duplicate numbers" do
    let(:ints) { [2, 3, 2] }

    it "should return one" do
      expect(SmallestMissing.call(ints)).to eq(1)
    end
  end
end
