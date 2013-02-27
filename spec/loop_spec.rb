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
  end
end
