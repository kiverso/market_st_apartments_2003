require 'rspec/autorun'
require './lib/renter'

describe Renter do
  it "exists" do
    renter1 = Renter.new("Jessie")
    expect(renter1).to be_an_instance_of(Renter)
  end

  it "Has readable attributes" do
    renter1 = Renter.new("Jessie")
    expect(renter1.name).to eq("Jessie")
  end
end
