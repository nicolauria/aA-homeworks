require 'rspec'
require_relative '../lib/dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "William") }
  let(:cookie) { Dessert.new("Cookie", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("Cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "fluffy", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("cookie dough")
      expect(cookie.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "dough", "eggs"]
      ingredients.each { |el| cookie.add_ingredient(el) }

      cookie.mix!
      expect(cookie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(25)
      expect(cookie.quantity).to eq(75)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(200) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef William the Great Baker!")
      expect(cookie.serve).to eq("Chef William the Great Baker has made 100 Cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
    end
  end
end
