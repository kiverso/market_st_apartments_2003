require 'minitest/autorun'
require './lib/renter'
require './lib/apartment'
class ApartmentTest < Minitest::Test
  def test_it_exists
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    assert_instance_of Apartment, unit1
  end

  def test_it_can_read_initial_apartment_information
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    assert_equal "A1", unit1.number
    assert_equal 1200, unit1.monthly_rent
    assert_equal 1, unit1.bathrooms
    assert_equal 1, unit1.bedrooms
    assert_equal nil, unit1.renter
  end

  def test_it_can_add_renter
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Jessie")
    assert_nil unit1.renter

    unit1.add_renter(renter1)
    assert_equal renter1, unit1.renter
    assert_equal "Jessie", unit1.renter.name
  end

  def test_it_can_get_annual_rent
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expected = 14400
    assert_equal expected, unit1.annual_rent
  end

  def test_it_can_get_bed_and_bath_details
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expected = {:bathrooms => 1, :bedrooms => 1}
    assert_equal expected, unit1.bed_and_bath
  end
end
