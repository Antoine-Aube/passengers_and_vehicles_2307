require './lib/vehicle'
require './lib/passenger'
require './lib/Park'

RSpec.describe Passenger do 
  before(:each) do 
    @park = Park.new("Liberty Park", 5)
    @vehicle = Vehicle.new("2001", "Honda", "Civic")  
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    
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

      @park.administer_vehicle(@vehicle)

      expect(@park.vehicles).to eq([@vehicle])
    end
  end

  describe "list_passengers" do 
    it "can list all passengers from administers vehicles" do 
      expect(@park.visitors).to eq([])

      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(@jude)

      @park.administer_vehicle(@vehicle)

      expect(@park.visitors).to eq([@charlie, @taylor, @jude])
    end
  end
end 