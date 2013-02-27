require_relative "dictionary"

module Forth
  class Program
    def initialize
      @stack = []
      @rstack = []
      @pointer_loc = 0
      @pointers = []
      @output = ""
      @dictionary = Dictionary.new self
      @tokens = []
    end

    def run(tokens)
      @tokens << tokens
      @pointers << 0
      until @pointers.last >= @tokens.last.count
        parse_token(@tokens.last[@pointers.last])
        @pointers[@pointers.count-1] = @pointers.last + 1
      end
      @pointers.pop
      @tokens.pop
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
      @pointers.last
    end

    def push_rstack val
      @rstack << val.to_i
    end

    def pop_rstack
      raise "rstack underflow" if @rstack.empty?
      @rstack.pop
    end

    def current_token
      @tokens.last[@pointers.last]
    end

    def pointer_jump location
      @pointers.pop
      @pointers << location
    end
  end
end
