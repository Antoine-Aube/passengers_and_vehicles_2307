require './lib/vehicle'
require './lib/passenger'
require './lib/Park'

RSpec.describe Passenger do 
  before(:each) do 
    @park = Park.new("Liberty Park", 5)
    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")  
    @vehicle_2 = Vehicle.new("20012", "Ford", "Fiesta")  
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @steve = Passenger.new({"name" => "Steve", "age" => 19})
    @reagan= Passenger.new({"name" => "Reagan", "age" => 14})
    
    
  end
  describe "#initialize" do
    it "can exist" do 
      expect(@park).to be_a Park
    end

    it "has a name and admission price" do 
      expect(@park.name).to eq("Liberty Park")
      expect(@park.admission_price).to eq(5)
    end
  end

  describe "add_vehicle" do
    it "can add vehicles" do 
      expect(@park.vehicles).to eq([])

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)


      expect(@park.vehicles).to eq([@vehicle_1, @vehicle_2])
    end
  end

  describe "passengers" do 
    it "can list all visitors from added vehicles" do 
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)
      # require 'pry';binding.pry
  
      
      expect(@park.passengers).to eq([@charlie, @taylor, @jude, @steve, @reagan])
    end
  end

  describe "#revenue" do 
    it "can calculate revenue based on number of adults added" do
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)
      # require 'pry';binding.pry

      expect(@park.revenue).to eq(15)
    end
  end

  describe "#all_attendees" do 
    it "returns a list of all attendees names sorted alphabetically" do 
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)
      # require 'pry';binding.pry
      expect(@park.all_attendees).to eq(["Charlie", "Jude", "Reagan", "Steve", "Taylor"])
    end
  end

  describe "#minors" do 
    it "can find a list of minors" do 
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)
      # require 'pry';binding.pry

      expect(@park.minors).to eq(["Reagan", "Taylor"])
    end
  end

  describe "#adults" do 
    it "can find a list of adults" do 
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.add_vehicle(@vehicle_1)
      @park.add_vehicle(@vehicle_2)
      # require 'pry';binding.pry

      expect(@park.adults).to eq(["Charlie", "Jude", "Steve"])    
    end 
  end 
end 