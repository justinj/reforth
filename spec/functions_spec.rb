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
end
