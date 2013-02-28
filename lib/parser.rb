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
      tokens = code.split(/\s+/)
      parse(tokens)
    end

    def parse(tokens)
      tree = []
      until tokens.empty?
        token = tokens.shift
        return [tree] if ends_block?(token)
        return [tree] + parse(tokens) if mid_block?(token)
        tree << token
        tree << parse(tokens) if begins_block?(token)
      end
      tree
    end

    def begins_block?(token)
      ["IF","DO"].include? token
    end

    # some things, like ELSE, split up a block to two
    def mid_block?(token)
      token == "ELSE"
    end

    def ends_block?(token)
      ["THEN", "LOOP"].include? token
    end
  end
end
