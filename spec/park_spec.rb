require './lib/vehicle'
require './lib/passenger'

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
  end
end 