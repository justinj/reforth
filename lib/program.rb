require_relative "dictionary"

module Forth
  class Program
    attr_accessor :loops

    def initialize
      @stack = []
      @loops = []
      @rstack = []
      @pointers = []
      @output = ""
      @dictionary = Dictionary.new self
      @tokens = []
      @output_block = nil
    end

    def run(tokens)
      @output = ""
      sub_run(tokens)
    end

    def sub_run(tokens)
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

    def on_output(&block)
      @output_block = block
    end

    def output text
      new_output = @output == "" ? "" : " "
      new_output << text 
      @output += new_output
      @output_block.call(new_output) if @output_block
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

    def stack_depth
      @stack.count
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
