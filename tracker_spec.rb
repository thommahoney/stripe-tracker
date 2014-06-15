require 'rspec'
require './service.rb'
require './tracker.rb'

RSpec.describe Tracker do
  let(:tracker) { Tracker.new }
  let(:service) { Service.new("api") }

  before(:each) do
    tracker.register_service(service)
  end

  context "with some boxes" do
    before(:each) do
      expect {
        3.times do |index|
          tracker.allocate(service.name)
        end
      }.to change { service.indexes.count }.by(3)
    end

    context "with a deallocated box" do
      before(:each) do
        expect {
          tracker.deallocate("api_2")
        }.to change { service.indexes.count }.by(-1)
      end

      it "reallocates a box" do
        new_box_name = tracker.allocate(service.name)

        expect(new_box_name).to eq("api_2")
      end
    end
  end
end
