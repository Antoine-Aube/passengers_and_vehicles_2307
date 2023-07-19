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
end