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
end
