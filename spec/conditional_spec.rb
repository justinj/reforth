require_relative "spec_helper"

describe Forth::Conditional do
  let(:parser) { Forth::Parser.new }

  describe "#=" do
    it "puts a truthy value on top of the stack if the top things are equal" do
      parser.run("5 5 = .").should_not eql "0"
    end

    it "puts a falsey value on top of the stack if the top things are not equal " do
      parser.run("5 6 = .").should eql "0"
    end
  end

  describe "#IF" do
    it "executes up to THEN if the thing on top of the stack is truthy" do
      parser.run("1 IF 5 . THEN").should eql "5"
    end

    it "doesn't execute up to the THEN if the thing on top of the stack is falsey" do
      parser.run("0 IF 5 . THEN").should eql ""
    end

    it "can be nested" do
      parser.run("0 IF 1 IF THEN 5 . THEN").should eql ""
    end
  end

  describe "#ELSE" do
    it "is executed if an IF is not" do
      parser.run("0 IF 1 . ELSE 2 . THEN").should eql "2"
    end
  end
end
