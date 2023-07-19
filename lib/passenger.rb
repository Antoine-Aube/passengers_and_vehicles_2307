class Passenger
  attr_reader :name,
              :age

  def initialize(passenger_info)
    @name = passenger_info[:name]
    @age = passenger_info[:age]
  end
end