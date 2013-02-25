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
end
