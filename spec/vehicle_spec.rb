require './lib/vehicle'
require './lib/passenger'

RSpec.describe Passenger do 
  before(:each) do 
    @vehicle = Vehicle.new("2001", "Honda", "Civic")  
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    
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

      expect(@vehicle.speeding).to be true
    end
  end

  describe "#add_passenger" do 
    it "can add passengers to passengers array" do 
      expect(@vehicle.passengers).to eq([])

    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@taylor)
    @vehicle.add_passenger(@jude)

    expect(@vehicle.passengers).to eq([@charlie, @taylor, @jude])
    end
  end

  describe "#num_adults" do 
    it "can return number of adults that are in the vehicle as an integer" do 
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(@jude)

      expect(@vehicle.num_adults).to eq(2)
    end
  end
end