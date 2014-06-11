require 'rspec'
require './tracker.rb'

RSpec.describe Tracker do
  let(:service_name) { "api" }

  context "with some boxes" do
    before(:each) do
      3.times do |index|
        Tracker.allocate("#{service_name}")
      end
    end

    context "with a deallocated box" do
      before(:each) do
        Tracker.deallocate("api_2")
      end

      it "deallocates a box" do
        new_box_name = Tracker.allocate(service_name)

        expect(new_box_name).to eq("api_2")
      end
    end
  end
end
