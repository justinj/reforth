require_relative "spec_helper"

describe Forth::Loop do
  let (:parser) { Forth::Parser.new }

  describe "#DO" do
    it "loops from the upper index to the lower" do
      parser.run("3 0 DO 5 . LOOP").should eql "5 5 5"  
    end

    it "doesn't loop if the bounds are the same" do
      parser.run("3 3 DO 5 . LOOP").should eql ""
    end

    it "evaluates I to the loop iteration" do
      parser.run("4 2 DO I . LOOP").should eql "2 3"
    end

    it "evaluates J to the other loop iteration" do
      parser.run("2 0 DO 2 0 DO J . LOOP LOOP").should eql "0 0 1 1"
    end
  end
end
