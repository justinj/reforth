require_relative "program"

module Forth
  class Parser
    def initialize
      @program = Program.new
    end

    def run(code)
      tokens = tokenize(code) 
      @program.run(tokens)
    end 

    def tokenize(code)
      code.split(/\s/)
    end
  end
end
