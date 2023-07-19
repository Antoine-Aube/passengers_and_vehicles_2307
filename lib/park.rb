class Park 
  attr_reader :name,
              :admission_price,
              :vehicles
          
  
  def initialize(name, admission_price)
    @name = name 
    @admission_price = admission_price
    @vehicles = []
  end

  def administer_vehicle(vehicle)
    @vehicles << vehicle
  end

  def list_passengers
    passengers = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        passengers << passenger
      end
    end
    passengers.flatten!
    passengers
  end

  def calculate_revenue
    passengers = list_passengers 
    adult_passengers = passengers.find_all { |passenger| passenger.adult? }
    revenue = adult_passengers.length * @admission_price
    revenue
  end
end