class Park 
  attr_reader :name,
              :admission_price,
              :vehicles,
              :passengers,
              :revenue
          
  
  def initialize(name, admission_price)
    @name = name 
    @admission_price = admission_price
    @vehicles = []
    @passengers = []
    @revenue = 0
  end

  def administer_vehicle(vehicle)
    @vehicles << vehicle
  end

  def list_passengers
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        @passengers << passenger
      end
    end
    @passengers
  end

  def calculate_revenue
    passengers = list_passengers 
    adult_passengers = passengers.find_all { |passenger| passenger.adult? }
    revenue = adult_passengers.length * @admission_price
    @revenue += revenue
  end

  def all_attendees
    names = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        names << passenger.name
      end 
    end
    names.sort
  end
end