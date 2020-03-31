class Building
  attr_reader :units
  def initialize(units = [])
    @units = units
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do|unit|
      if unit.renter == nil
        nil
      else
        unit.renter.name
      end
    end.compact
  end

  def average_rent
    rents = units.map{|unit| unit.monthly_rent}.compact
    (rents.sum.to_f / rents.length.to_f).round(1)
  end

  def rented_units
    @units.select{|unit| unit.renter != nil}
  end

  def renter_with_highest_rent
    highest_rent = rented_units.max_by{|unit| unit.monthly_rent}
    highest_rent.renter
  end

  def units_by_number_of_bedrooms
  bedrooms = units.group_by{|unit| unit.bedrooms}
  bedrooms.map do |key, value|
    [key, value.map{|value| value.number}]
  end.to_h
  end

end
