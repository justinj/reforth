require_relative "spec_helper"

describe Forth::Operator do
  let(:parser) { Forth::Parser.new }
  describe "#SWAP" do
    it "swaps the top two values" do
      parser.run("1 2 SWAP . .").should eql "1 2" 
    end
  end

  describe "#DROP" do
    it "drops the top value" do
      parser.run("1 2 DROP .").should eql "1"
    end
  end
end
