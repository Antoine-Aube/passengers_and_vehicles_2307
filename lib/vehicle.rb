class Vehicle
  attr_reader :name, 
              :make,
              :model
  
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
  end
end