require_relative "spec_helper"

describe Forth::Core do
  let(:parser) { Forth::Parser.new }

  describe "#." do
    it "outputs the thing on top of the stack" do
      parser.run("5 .").should eql "5"
    end
  end

  describe "#DUP" do
    it "duplicates the thing on top of the stack" do
      parser.run("5 DUP . .").should eql "5 5"
    end  
  end
end
