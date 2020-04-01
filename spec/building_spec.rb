require 'rspec/autorun'
require './lib/renter'
require './lib/apartment'
require './lib/building'

describe Building do
  it "exists" do
    building = Building.new
    expect(building).to be_an_instance_of(Building)
  end

  it "adds units" do
    building = Building.new
    expect(building.units).to eq([])
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    expect(building.units).to eql([unit1, unit2])
  end
end
