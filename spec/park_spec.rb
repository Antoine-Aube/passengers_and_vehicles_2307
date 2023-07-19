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
    @reagan= Passenger.new({"name" => "Jude", "age" => 14})
    
    
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

  describe "administer_vehicle" do
    it "can administer vehicles" do 
      expect(@park.vehicles).to eq([])

      @park.administer_vehicle(@vehicle_1)
      @park.administer_vehicle(@vehicle_2)


      expect(@park.vehicles).to eq([@vehicle_1, @vehicle_2])
    end
  end

  describe "list_visitors" do 
    it "can list all visitors from administered vehicles" do 
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.administer_vehicle(@vehicle_1)
      @park.administer_vehicle(@vehicle_2)
      # require 'pry';binding.pry
      expect(@park.list_visitors).to eq([@charlie, @taylor, @jude, @steve, @reagan])
    end
  end

  describe "calculate revenue" do 
    it "can calculate revenue based on number of adults administered" do
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_1.add_passenger(@jude)

      @vehicle_2.add_passenger(@steve)
      @vehicle_2.add_passenger(@reagan)

      @park.administer_vehicle(@vehicle_1)
      @park.administer_vehicle(@vehicle_2)

      expect(@park.calculate_revenue).to eq(15)
    end
  end
end 