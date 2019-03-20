require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("Mochi Ice Cream", 322, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Mochi Ice Cream")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(322)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients.empty?).to be true 
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("Mochi Ice Cream", "322", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("matcha")
      expect(dessert.ingredients).to eq(["matcha"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("glutinous rice flour")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("potato starch")
      dessert.add_ingredient("matcha ice cream")
      dessert.mix!
      expect(dessert.ingredients).to_not eq(["glutinous rice flour", "sugar", "potato starch", "matcha ice cream"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(317)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(9000)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(dessert.serve.include?("Chef Gordon the Great Baker")).to be true
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
