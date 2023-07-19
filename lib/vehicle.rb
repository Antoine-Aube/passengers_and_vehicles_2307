class Vehicle
  attr_reader :year, 
              :make,
              :model,
              :speeding,
              :passengers
  
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
    adult_counter = 0
    @passengers.each do |passenger|
      if passenger.adult? == true
        adult_counter += 1
      end
    end
    adult_counter
  end
end