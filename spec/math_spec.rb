require_relative "spec_helper"

describe Forth::Math do
  let(:parser) { Forth::Parser.new }

  describe "#plus" do
    it "adds the two things on top of the stack" do
      parser.run("2 3 +").should eql "5"
    end
  end
end
