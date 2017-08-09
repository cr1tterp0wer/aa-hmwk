require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) {Dessert.new("brownie",50,chef)}
  let(:chef) { double("Chef") }
  #let(:chef){ double(Chef.new("name"))}
  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie") 
    end
      
    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do 
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie",'50',chef) }.to raise_error()
    end
  end

  describe "#add_ingredient" do
    before(:each){brownie.add_ingredient("flour")}
    it "adds an ingredient to the ingredients array" do 
      expect(brownie.ingredients.last).to eq("flour")
    end
  end

  describe "#mix!" do
    subject(:tmp) {[]}
    before(:each) do 
      (1..20).each do |i| 
        brownie.add_ingredient(i)
      end
      tmp = (1..20).each{|x| x}
      brownie.mix!
    end
    it "shuffles the ingredient array" do 
      expect(brownie.ingredients).not_to eq(tmp) 
    end
  end

  describe "#eat" do
    before(:each) do 
      brownie.eat(2)
    end
    it "subtracts an amount from the quantity" do 
      expect(brownie.quantity).not_to eq(50) 
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { brownie.eat(60)}.to raise_error() 
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(brownie.serve).to eq("Chef Tucker the Great Baker has made 50 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
