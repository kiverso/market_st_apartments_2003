require 'rspec/autorun'
require './lib/renter'
require './lib/apartment'

describe Apartment do
  it "exists" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expect(unit1).to be_an_instance_of(Apartment)
  end

  it "has readable attributes" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expect(unit1.number).to eq("A1")
    expect(unit1.monthly_rent).to eq(1200)
    expect(unit1.bathrooms).to eq(1)
    expect(unit1.bedrooms).to eq(1)
    expect(unit1.renter).to be_nil
  end

  it "adds a renter" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Jessie")
    expect(unit1.renter).to be_nil

    unit1.add_renter(renter1)
    expect(unit1.renter).to eq(renter1)
  end

  it "can get annual rent" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expect(unit1.annual_rent).to eq(14400)
  end

  it "gets bedroom and bathroom details" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expected = {:bathrooms => 1, :bedrooms => 1}
    expect(unit1.bed_and_bath).to eq(expected)
  end
end
