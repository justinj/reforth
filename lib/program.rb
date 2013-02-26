require_relative "dictionary"

module Forth
  class Program
    def initialize
      @stack = []
      @rstack = []
      @pointer_loc = 0
      @current_output = ""
      @dictionary = Dictionary.new self
      @tokens = []
    end

    def run(tokens)
      @tokens += tokens
      @output = ""
      until @pointer_loc >= @tokens.count
        parse_token(@tokens[@pointer_loc])
        @pointer_loc += 1
      end
      @output
    end

    def parse_token token
      if number? token
        push(token)
      else
        @dictionary.run(token)
      end 
    end

    def output text
      @output += " " unless @output == ""
      @output << text 
    end

    def number?(token)
      /^\d+$/ =~ token 
    end

    def push(value)
      @stack << value.to_i
    end

    def pop
      raise "stack underflow" if @stack.empty?
      @stack.pop
    end

    def pointer_loc
      @pointer_loc
    end

    def push_rstack val
      @rstack << val.to_i
    end

    def pop_rstack
      raise "rstack underflow" if @rstack.empty?
      @rstack.pop
    end

    def token_at position
      @tokens[position] 
    end

    def pointer_jump location
      @pointer_loc = location
    end
  end
end
