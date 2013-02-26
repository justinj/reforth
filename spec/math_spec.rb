require_relative "spec_helper"

describe Forth::Math do
  let(:parser) { Forth::Parser.new }

  describe "#+" do
    it "adds the two things on top of the stack" do
      parser.run("2 3 + .").should eql "5"
    end
  end

  describe "#-" do
    it "subtracts the two things on top of the stack" do
      parser.run("4 1 - .").should eql "3"
    end
  end

  describe "#*" do
    it "multiplies the two things on top of the stack" do
      parser.run("3 4 * .").should eql "12"
    end
  end

  describe "#/" do
    it "divides the two things on top of the stack" do
      parser.run("10 5 / .").should eql "2"
    end

    it "raises an exception for division by 0" do
      lambda { parser.run("1 0 / .") }.should raise_error "division by 0"
    end
  end

  describe "#MOD" do
    it "produces the modulus of two numbers" do
      parser.run("7 2 MOD .").should eql "1"
    end

    it "raises and exception for division by 0" do
      lambda { parser.run("1 0 MOD .") }.should raise_error "division by 0"
    end
  end
end
