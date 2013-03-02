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

  describe "#OVER" do
    it "duplicates the second thing onto the top" do
      parser.run("1 2 OVER . . .").should eql "1 2 1"
    end
  end

  describe "#rstack" do
    it "can be placed onto" do
      lambda { parser.run("1 >R") }.should_not raise_error
    end

    it "can be popped off of" do
      parser.run("1 2 >R . R> .").should eql "1 2"
    end
  end
end
