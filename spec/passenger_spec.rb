require './lib/passenger'

RSpec.describe Passenger do 
  before(:each) do 
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
    
  end
  describe "#initialize" do
    it "can exist" do 
      expect(@charlie).to be_a Passenger
      expect(@taylor).to be_a Passenger
    end

    it "has a name and age" do 
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
    end
  end 

  describe "#adult?" do 
    it "is an adult if 18 or older in age" do
      expect(@charlie.adult?).to be true
      expect(@taylor.adult?).to be false
    end
  end
end