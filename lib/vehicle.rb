class Vehicle
  attr_reader :year, 
              :make,
              :model,
              :passengers
              #don't need @speeding in the attr_reader as the 
              #below method speeding? calls on it already 
  
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
  end

  def speeding? 
    @speeding
  end

  def speed
    @speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    #use count enumerable, return an integer instead of setting up a counter
    @passengers.count {|passenger| passenger.adult? == true }
  end
end