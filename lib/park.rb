class Park 
  attr_reader :name,
              :admission_price,
              :vehicles
              
  def initialize(name, admission_price)
    @name = name 
    @admission_price = admission_price
    @vehicles = []
    # @passengers = []
    # @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    # @vehicles.each do |vehicle|
    #   vehicle.passengers.each do |passenger|
    #     @passengers << passenger
    #   end
    # end
    # @passengers
    @vehicles.map {|vehicle| vehicle.passengers}.flatten
  end

  def revenue
    passengers.sum {|passenger| passenger.adult? ? @admission_price : 0}
  end

  def all_attendees
    #everytime you reach for this shovel into an array thinking
    #think about using map
  #   names = []
  #   @vehicles.each do |vehicle|
  #     vehicle.passengers.each do |passenger|
  #       names << passenger.name
  #     end 
  #   end
  #   names.sort
  # end
    passengers.map {|passenger| passenger.name}.sort
  end 

  def minors 
    #compact removes nil from the array since we are adding nil when the passenger
    #is an adult
    passengers.map {|passenger| passenger.adult? ? nil : passenger.name }.compact.sort
    #another way to write this (&:name) is essentially {|passenger| passenger.name}
    #passengers.select { |passenger| !passenger.adult? }.map(&:name).sort
  end

  def adults
    passengers.select {|passenger| passenger.adult?}.map(&:name).sort
  end
end