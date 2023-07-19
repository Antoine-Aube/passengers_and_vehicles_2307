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

  def list_visitors
    visitors = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        visitors << passenger
      end
    end
    visitors.flatten!
    visitors
  end

  def calculate_revenue
    visitors = list_visitors 
    adult_visitors = visitors.find_all { |visitor| visitor.adult? }
    revenue = adult_visitors.length * @admission_price
    revenue
  end
end