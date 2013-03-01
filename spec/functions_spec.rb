require_relative "spec_helper"

describe Forth::Parser do
  let(:parser) { Forth::Parser.new }

  describe "#:" do
    it "defines a word" do
      lambda { parser.run(": PUT_5 5 . ;") }.should_not raise_error
    end

    it "jumps to the next ;" do
      parser.run(": PUT_5 5 . ; 5 .").should eql "5"
    end

    it "allows the word to then be executed" do
      parser.run(": PUT_5 5 . ; PUT_5").should eql "5"
    end
  end 

  describe "#calling_functions" do
    it "can be done in another function" do
      parser.run(": PUT_5 5 . ; : PUT_55 PUT_5 PUT_5 ; PUT_55").should eql "5 5"
    end

    it "can be done in a loop" do
      parser.run(": PUT_5 5 . ; 5 0 DO PUT_5 LOOP").should eql "5 5 5 5 5"
    end
  end
end
