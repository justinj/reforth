require_relative "spec_helper"

describe Forth::Parser do
  let(:parser) { Forth::Parser.new }
  describe "#run" do
    it "takes tokens" do
      lambda { parser.run("1 2") }.should_not raise_error
    end

    it "prints out what's on top of the stack" do
      parser.run("1 .").should eql "1"
    end
  end 

  describe "#tokenize" do
    it "breaks tokens into an array" do
      parser.tokenize("5 5 5 ").should eql ["5","5","5"]
    end  

    it "makes a tree structure with IFs" do
      parser.tokenize("1 IF 5 . THEN").should eql ["1", "IF", ["5", "."]]
    end

    it "can nest IFs" do
      parser.tokenize("IF IF 5 . THEN THEN").
        should eql ["IF", ["IF", ["5", "."]]]
    end

    it "branches for ELSE" do
      parser.tokenize("IF 1 ELSE 2 THEN").
        should eql ["IF", [["1"], ["2"]]]
    end
  end
end
