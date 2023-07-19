require './lib/vehicle'
require './lib/passenger'

RSpec.describe Passenger do 
  before(:each) do 
    @vehicle = Vehicle.new("2001", "Honda", "Civic")  
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
    
  end
  describe "#initialize" do
    it "can exist" do 
      expect(@vehicle).to be_a Vehicle
    end

    it "has a year, make and model" do 
      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
    end
  end 

  describe "#speeding?" do 
    it "is not speeding unless speed method called" do 
      expect(@vehicle.speeding?).to be false

      @vehicle.speed

      expect(@vehicle.speeding).to be True
    end
  end
end