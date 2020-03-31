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
end
